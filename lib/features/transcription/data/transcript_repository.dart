import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../db/app_database.dart' as db;
import '../domain/transcript_segment.dart';

final transcriptRepositoryProvider = Provider<TranscriptRepository>((ref) {
  final database = ref.watch(db.appDatabaseProvider);
  return TranscriptRepositoryImpl(database);
});

abstract class TranscriptRepository {
  Future<List<TranscriptSegment>> getByLectureId(int lectureId);
  Future<void> saveSegments(int lectureId, List<TranscriptSegment> segments);
  Future<void> deleteByLectureId(int lectureId);
  Stream<List<TranscriptSegment>> watchByLectureId(int lectureId);
}

class TranscriptRepositoryImpl implements TranscriptRepository {
  final db.AppDatabase _database;
  TranscriptRepositoryImpl(this._database);

  @override
  Future<List<TranscriptSegment>> getByLectureId(int lectureId) async {
    final rows = await (_database.select(_database.transcriptSegments)
          ..where((t) => t.lectureId.equals(lectureId))
          ..orderBy([(t) => OrderingTerm(
                expression: t.startSeconds, mode: OrderingMode.asc)]))
        .get();
    return rows.map(_toDomain).toList();
  }

  @override
  Future<void> saveSegments(
      int lectureId, List<TranscriptSegment> segments) async {
    final now = DateTime.now();
    await _database.batch((batch) {
      batch.deleteWhere(
          _database.transcriptSegments,
          (t) => t.lectureId.equals(lectureId));

      for (final segment in segments) {
        batch.insert(_database.transcriptSegments, db.TranscriptSegmentsCompanion(
          lectureId: Value(lectureId),
          startSeconds: Value(segment.startSeconds),
          endSeconds: Value(segment.endSeconds),
          content: Value(segment.text),
          createdAt: Value(now),
          updatedAt: Value(now),
          syncStatus: const Value('localOnly'),
          deviceId: const Value(''),
        ));
      }
    });
  }

  @override
  Future<void> deleteByLectureId(int lectureId) async {
    await (_database.delete(_database.transcriptSegments)
          ..where((t) => t.lectureId.equals(lectureId)))
        .go();
  }

  @override
  Stream<List<TranscriptSegment>> watchByLectureId(int lectureId) {
    return (_database.select(_database.transcriptSegments)
          ..where((t) => t.lectureId.equals(lectureId))
          ..orderBy([(t) => OrderingTerm(
                expression: t.startSeconds, mode: OrderingMode.asc)]))
        .watch()
        .map((rows) => rows.map(_toDomain).toList());
  }

  TranscriptSegment _toDomain(db.TranscriptSegment row) {
    return TranscriptSegment(
      id: row.id,
      remoteId: row.remoteId,
      lectureId: row.lectureId,
      startSeconds: row.startSeconds,
      endSeconds: row.endSeconds,
      text: row.content,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
}