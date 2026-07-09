import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../db/app_database.dart' as db;
import '../domain/lecture.dart';

final lectureRepositoryProvider = Provider<LectureRepository>((ref) {
  final database = ref.watch(db.appDatabaseProvider);
  return LectureRepositoryImpl(database);
});

abstract class LectureRepository {
  Future<List<Lecture>> getAll();
  Future<Lecture?> getById(int id);
  Future<Lecture?> findByRemoteId(String remoteId);
  Future<Lecture> create(Lecture lecture);
  Future<Lecture> update(Lecture lecture);
  Future<void> delete(int id);
  Future<List<Lecture>> search(String query);
  Future<List<Lecture>> getRecent({int limit = 10});
  Stream<List<Lecture>> watchAll();
  Future<void> upsertFromRemoteLecture(Lecture lecture);
}

class LectureRepositoryImpl implements LectureRepository {
  final db.AppDatabase _database;
  LectureRepositoryImpl(this._database);

  @override
  Future<Lecture> create(Lecture lecture) async {
    final now = DateTime.now();
    final id = await _database.into(_database.lectures).insert(
          db.LecturesCompanion(
            title: Value(lecture.title),
            createdAt: Value(now),
            updatedAt: Value(now),
            syncStatus: const Value('localOnly'),
            deviceId: Value(lecture.deviceId),
            audioPath: Value(lecture.audioPath),
            wavPath: Value(lecture.wavPath),
            durationSeconds: Value(lecture.durationSeconds),
            transcriptionStatus: const Value('notStarted'),
            summaryStatus: const Value('notStarted'),
            obsidianExportStatus: const Value('notExported'),
          ),
        );
    return lecture.copyWith(id: id, createdAt: now, updatedAt: now);
  }

  @override
  Future<void> delete(int id) async {
    await (_database.delete(_database.lectures)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  @override
  Future<Lecture?> getById(int id) async {
    final row = await (_database.select(_database.lectures)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (row == null) return null;
    return _toDomain(row);
  }

  @override
  Future<Lecture?> findByRemoteId(String remoteId) async {
    final row = await (_database.select(_database.lectures)
          ..where((t) => t.remoteId.equals(remoteId)))
        .getSingleOrNull();
    if (row == null) return null;
    return _toDomain(row);
  }

  @override
  Future<List<Lecture>> getRecent({int limit = 10}) async {
    final rows = await (_database.select(_database.lectures)
          ..orderBy([(t) => OrderingTerm(
                expression: t.createdAt, mode: OrderingMode.desc)])
          ..limit(limit))
        .get();
    return rows.map(_toDomain).toList();
  }

  @override
  Future<List<Lecture>> getAll() async {
    final rows = await (_database.select(_database.lectures)
          ..orderBy([(t) => OrderingTerm(
                expression: t.createdAt, mode: OrderingMode.desc)]))
        .get();
    return rows.map(_toDomain).toList();
  }

  @override
  Future<List<Lecture>> search(String query) async {
    final pattern = '%$query%';
    final rows = await (_database.select(_database.lectures)
          ..where((t) => t.title.like(pattern))
          ..orderBy([(t) => OrderingTerm(
                expression: t.createdAt, mode: OrderingMode.desc)]))
        .get();
    return rows.map(_toDomain).toList();
  }

  @override
  Future<void> upsertFromRemoteLecture(Lecture lecture) async {
    if (lecture.remoteId != null) {
      final existing = await findByRemoteId(lecture.remoteId!);
      if (existing != null) {
        await update(lecture.copyWith(id: existing.id));
        return;
      }
    }
    await create(lecture);
  }

  @override
  Future<Lecture> update(Lecture lecture) async {
    final now = DateTime.now();
    await (_database.update(_database.lectures)
          ..where((t) => t.id.equals(lecture.id)))
        .write(
          db.LecturesCompanion(
            remoteId: Value(lecture.remoteId),
            title: Value(lecture.title),
            updatedAt: Value(now),
            syncStatus: Value(lecture.syncStatus),
            audioPath: Value(lecture.audioPath),
            wavPath: Value(lecture.wavPath),
            durationSeconds: Value(lecture.durationSeconds),
            transcriptionStatus: Value(lecture.transcriptionStatus),
            summaryStatus: Value(lecture.summaryStatus),
            obsidianExportStatus: Value(lecture.obsidianExportStatus),
          ),
        );
    return lecture.copyWith(updatedAt: now);
  }

  @override
  Stream<List<Lecture>> watchAll() {
    return (_database.select(_database.lectures)
          ..orderBy([(t) => OrderingTerm(
                expression: t.createdAt, mode: OrderingMode.desc)]))
        .watch()
        .map((rows) => rows.map(_toDomain).toList());
  }

  Lecture _toDomain(db.Lecture row) {
    return Lecture(
      id: row.id,
      remoteId: row.remoteId,
      title: row.title,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      deletedAt: row.deletedAt,
      syncStatus: row.syncStatus,
      deviceId: row.deviceId,
      version: row.version,
      audioPath: row.audioPath,
      wavPath: row.wavPath,
      durationSeconds: row.durationSeconds,
      transcriptionStatus: row.transcriptionStatus,
      summaryStatus: row.summaryStatus,
      obsidianExportStatus: row.obsidianExportStatus,
    );
  }
}