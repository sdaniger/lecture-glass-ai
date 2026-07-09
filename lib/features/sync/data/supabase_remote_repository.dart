import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/logger.dart';
import '../../../core/errors.dart';
import '../domain/remote_repository_interface.dart';
import '../../lectures/domain/lecture.dart';
import '../../transcription/domain/transcript_segment.dart';
import '../../summary/domain/topic.dart';
import '../../summary/domain/lecture_summary.dart';

final remoteLectureRepositoryProvider =
    Provider<RemoteLectureRepository>((ref) {
  return SupabaseRemoteRepository();
});

class SupabaseRemoteRepository implements RemoteLectureRepository {
  SupabaseClient? _client;
  bool _connected = false;

  @override
  bool get isConnected => _connected;

  @override
  Future<void> connect({
    required String url,
    required String publishableKey,
  }) async {
    if (_connected && _client != null) return;
    try {
      // Supabase.initialize は1度だけ呼べる
      try {
        _client = Supabase.instance.client;
      } catch (_) {
        await Supabase.initialize(url: url, anonKey: publishableKey);
        _client = Supabase.instance.client;
      }
      _connected = true;
      AppLogger.i('Supabase connected');
    } catch (e) {
      AppLogger.e('Failed to connect to Supabase', e);
      throw SyncError('Supabase接続に失敗しました: $e');
    }
  }

  @override
  Future<void> disconnect() async {
    _client = null;
    _connected = false;
    AppLogger.i('Supabase disconnected');
  }

  @override
  Future<void> uploadLecture(Lecture lecture) async {
    await _ensureConnected();
    await _client!.from('lectures').upsert({
      'id': lecture.remoteId ?? lecture.id.toString(),
      'title': lecture.title,
      'created_at': lecture.createdAt.toIso8601String(),
      'updated_at': lecture.updatedAt.toIso8601String(),
      'device_id': lecture.deviceId,
      'version': lecture.version,
      'duration_seconds': lecture.durationSeconds,
      'transcription_status': lecture.transcriptionStatus,
      'summary_status': lecture.summaryStatus,
      'obsidian_export_status': lecture.obsidianExportStatus,
    });
  }

  @override
  Future<void> updateLecture(Lecture lecture) async {
    await _ensureConnected();
    await _client!.from('lectures').update({
      'title': lecture.title,
      'updated_at': lecture.updatedAt.toIso8601String(),
      'version': lecture.version,
      'duration_seconds': lecture.durationSeconds,
      'transcription_status': lecture.transcriptionStatus,
      'summary_status': lecture.summaryStatus,
      'obsidian_export_status': lecture.obsidianExportStatus,
    }).match({'id': lecture.remoteId ?? lecture.id.toString()});
  }

  @override
  Future<void> deleteLecture(String remoteId) async {
    await _ensureConnected();
    await _client!.from('lectures').delete().match({'id': remoteId});
  }

  @override
  Future<List<Lecture>> fetchLectures({
    required String deviceId,
    required DateTime since,
  }) async {
    await _ensureConnected();
    final data = await _client!
        .from('lectures')
        .select()
        .neq('device_id', deviceId)
        .gte('updated_at', since.toIso8601String()) as List<dynamic>;
    return data
        .map((json) => _parseLecture(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> uploadSegments(List<TranscriptSegment> segments) async {
    await _ensureConnected();
    final data = segments.map((s) => {
      'lecture_id': s.lectureId.toString(),
      'start_seconds': s.startSeconds,
      'end_seconds': s.endSeconds,
      'content': s.text,
      'created_at': s.createdAt.toIso8601String(),
      'updated_at': s.updatedAt.toIso8601String(),
    }).toList();
    await _client!.from('transcript_segments').upsert(data);
  }

  @override
  Future<List<TranscriptSegment>> fetchSegments({
    required String lectureRemoteId,
    required DateTime since,
  }) async {
    await _ensureConnected();
    final data = await _client!
        .from('transcript_segments')
        .select()
        .eq('lecture_id', lectureRemoteId)
        .gte('updated_at', since.toIso8601String()) as List<dynamic>;
    return data
        .map((json) {
          final m = json as Map<String, dynamic>;
          return TranscriptSegment(
            id: 0,
            lectureId: int.tryParse(m['lecture_id']?.toString() ?? '') ?? 0,
            startSeconds: (m['start_seconds'] as num?)?.toDouble() ?? 0,
            endSeconds: (m['end_seconds'] as num?)?.toDouble() ?? 0,
            text: m['content'] as String? ?? '',
            createdAt: DateTime.tryParse(m['created_at'] as String? ?? '') ??
                DateTime.now(),
            updatedAt: DateTime.tryParse(m['updated_at'] as String? ?? '') ??
                DateTime.now(),
          );
        })
        .toList();
  }

  @override
  Future<void> uploadTopics(List<Topic> topics) async {
    await _ensureConnected();
    final data = topics.map((t) => {
      'lecture_id': t.lectureId.toString(),
      'start_seconds': t.startSeconds,
      'end_seconds': t.endSeconds,
      'title': t.title,
      'summary': t.summary,
      'importance': t.importance,
      'keywords': t.keywords,
    }).toList();
    await _client!.from('topics').upsert(data);
  }

  @override
  Future<List<Topic>> fetchTopics({
    required String lectureRemoteId,
    required DateTime since,
  }) async {
    await _ensureConnected();
    final data = await _client!
        .from('topics')
        .select()
        .eq('lecture_id', lectureRemoteId)
        .gte('updated_at', since.toIso8601String()) as List<dynamic>;
    return data.map((json) {
      final m = json as Map<String, dynamic>;
      return Topic(
        id: 0,
        lectureId: int.tryParse(m['lecture_id']?.toString() ?? '') ?? 0,
        startSeconds: (m['start_seconds'] as num?)?.toDouble() ?? 0,
        endSeconds: (m['end_seconds'] as num?)?.toDouble() ?? 0,
        title: m['title'] as String? ?? '',
        summary: m['summary'] as String? ?? '',
        importance: (m['importance'] as num?)?.toInt() ?? 3,
        keywords: (m['keywords'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
        createdAt: DateTime.tryParse(m['created_at'] as String? ?? '') ??
            DateTime.now(),
        updatedAt: DateTime.tryParse(m['updated_at'] as String? ?? '') ??
            DateTime.now(),
      );
    }).toList();
  }

  @override
  Future<void> uploadSummary(LectureSummary summary) async {
    await _ensureConnected();
    await _client!.from('lecture_summaries').upsert({
      'lecture_id': summary.lectureId.toString(),
      'overall_summary': summary.overallSummary,
      'review_points': summary.reviewPoints,
      'exam_points': summary.examPoints,
      'keywords': summary.keywords.map((k) => {
        'word': k.word,
        'explanation': k.explanation,
      }).toList(),
    });
  }

  @override
  Future<LectureSummary?> fetchSummary({
    required String lectureRemoteId,
    required DateTime since,
  }) async {
    await _ensureConnected();
    final m = await _client!
        .from('lecture_summaries')
        .select()
        .eq('lecture_id', lectureRemoteId)
        .gte('updated_at', since.toIso8601String())
        .maybeSingle();
    if (m == null) return null;
    return LectureSummary(
      id: 0,
      lectureId: int.tryParse(m['lecture_id']?.toString() ?? '') ?? 0,
      overallSummary: m['overall_summary'] as String? ?? '',
      reviewPoints: (m['review_points'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      examPoints: (m['exam_points'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      keywords: (m['keywords'] as List<dynamic>?)
              ?.map((e) {
                final kw = e as Map<String, dynamic>;
                return KeywordExplanation(
                  word: kw['word'] as String? ?? '',
                  explanation: kw['explanation'] as String? ?? '',
                );
              })
              .toList() ??
          [],
      createdAt: DateTime.tryParse(m['created_at'] as String? ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(m['updated_at'] as String? ?? '') ??
          DateTime.now(),
    );
  }

  Lecture _parseLecture(Map<String, dynamic> json) {
    return Lecture(
      id: 0,
      remoteId: json['id']?.toString(),
      title: json['title'] as String? ?? '',
      createdAt: DateTime.tryParse(json['created_at'] as String? ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] as String? ?? '') ??
          DateTime.now(),
      deviceId: json['device_id'] as String? ?? '',
      version: (json['version'] as num?)?.toInt() ?? 1,
      durationSeconds: (json['duration_seconds'] as num?)?.toDouble(),
      transcriptionStatus: json['transcription_status'] as String? ?? 'notStarted',
      summaryStatus: json['summary_status'] as String? ?? 'notStarted',
      obsidianExportStatus:
          json['obsidian_export_status'] as String? ?? 'notExported',
    );
  }

  Future<void> _ensureConnected() async {
    if (!_connected) {
      throw SyncError('Supabaseに接続されていません');
    }
  }
}