import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/errors.dart';
import '../../../core/logger.dart';
import '../../lectures/data/lecture_repository.dart';
import '../../transcription/data/transcript_repository.dart';
import '../../summary/data/topic_repository.dart';
import '../domain/remote_repository_interface.dart';
import '../domain/sync_service_interface.dart';
import '../domain/conflict_resolver_interface.dart';
import 'supabase_remote_repository.dart';
import 'conflict_resolver.dart';

final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncServiceImpl(
    remoteRepository: ref.watch(remoteLectureRepositoryProvider),
    lectureRepository: ref.watch(lectureRepositoryProvider),
    transcriptRepository: ref.watch(transcriptRepositoryProvider),
    topicRepository: ref.watch(topicRepositoryProvider),
    conflictResolver: ref.watch(conflictResolverProvider),
  );
});

class SyncServiceImpl implements SyncService {
  final RemoteLectureRepository _remote;
  final LectureRepository _local;
  final TranscriptRepository _transcript;
  final TopicRepository _topic;
  final ConflictResolver _resolver;

  SyncStatus _status = SyncStatus.idle;
  String? _lastErrorMessage;
  DateTime? _lastSyncAt;

  final _statusController = StreamController<SyncStatus>.broadcast();

  SyncServiceImpl({
    required RemoteLectureRepository remoteRepository,
    required LectureRepository lectureRepository,
    required TranscriptRepository transcriptRepository,
    required TopicRepository topicRepository,
    required ConflictResolver conflictResolver,
  })  : _remote = remoteRepository,
        _local = lectureRepository,
        _transcript = transcriptRepository,
        _topic = topicRepository,
        _resolver = conflictResolver;

  @override
  SyncStatus get status => _status;

  @override
  String? get lastErrorMessage => _lastErrorMessage;

  @override
  DateTime? get lastSyncAt => _lastSyncAt;

  @override
  Stream<SyncStatus> watchStatus() => _statusController.stream;

  void _setStatus(SyncStatus s) {
    _status = s;
    _statusController.add(s);
  }

  @override
  Future<void> fullSync({required String deviceId}) async {
    if (_status == SyncStatus.syncing) return;
    _setStatus(SyncStatus.syncing);
    _lastErrorMessage = null;

    try {
      await _syncLectures(deviceId, since: _lastSyncAt ?? DateTime(2020));
      _lastSyncAt = DateTime.now();
      _setStatus(SyncStatus.success);
    } on SyncError catch (e) {
      _lastErrorMessage = e.message;
      AppLogger.e('Sync failed', e);
      _setStatus(SyncStatus.error);
    } on Exception catch (e) {
      _lastErrorMessage = e.toString();
      AppLogger.e('Sync failed', e);
      _setStatus(SyncStatus.error);
    }
  }

  @override
  Future<void> syncLecture({
    required int lectureId,
    required String deviceId,
  }) async {
    if (_status == SyncStatus.syncing) return;
    _setStatus(SyncStatus.syncing);
    _lastErrorMessage = null;

    try {
      final local = await _local.getById(lectureId);
      if (local == null) {
        _lastErrorMessage = '講義が見つかりません: $lectureId';
        _setStatus(SyncStatus.error);
        return;
      }
      await _remote.uploadLecture(local);

      final segments = await _transcript.getByLectureId(lectureId);
      await _remote.uploadSegments(segments);

      final topics = await _topic.getByLectureId(lectureId);
      await _remote.uploadTopics(topics);

      _lastSyncAt = DateTime.now();
      _setStatus(SyncStatus.success);
    } on SyncError catch (e) {
      _lastErrorMessage = e.message;
      _setStatus(SyncStatus.error);
    } on Exception catch (e) {
      _lastErrorMessage = e.toString();
      _setStatus(SyncStatus.error);
    }
  }

  @override
  Future<void> cancelSync() async {
    _setStatus(SyncStatus.idle);
  }

  Future<void> _syncLectures(String deviceId, {required DateTime since}) async {
    final remoteLectures =
        await _remote.fetchLectures(deviceId: deviceId, since: since);
    final localLectures = await _local.getAll();

    for (final remote in remoteLectures) {
      final localMatch =
          localLectures.where((l) => l.title == remote.title).firstOrNull;

      if (localMatch == null) {
        await _local.upsertFromRemoteLecture(remote);
      } else {
        final resolution = _resolver.resolve(ConflictInfo(
          localId: localMatch.id,
          remoteId: remote.remoteId,
          entityType: 'lecture',
          localUpdatedAt: localMatch.updatedAt,
          remoteUpdatedAt: remote.updatedAt,
          localValues: {'title': localMatch.title},
          remoteValues: {'title': remote.title},
        ));

        if (resolution == ConflictResolution.useRemote) {
          await _local.update(remote.copyWith(id: localMatch.id));
        }
      }
    }

    // ローカル→リモート：remoteIdがnullのものをアップロード
    for (final local in localLectures) {
      if (local.remoteId == null) {
        await _remote.uploadLecture(local);
      }
    }
  }
}
