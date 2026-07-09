import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../db/app_database.dart' as db;
import '../domain/topic.dart';
import '../domain/lecture_summary.dart';

final topicRepositoryProvider = Provider<TopicRepository>((ref) {
  final database = ref.watch(db.appDatabaseProvider);
  return TopicRepositoryImpl(database);
});

abstract class TopicRepository {
  Future<List<Topic>> getByLectureId(int lectureId);
  Future<void> saveTopics(int lectureId, List<Topic> topics);
  Future<void> deleteByLectureId(int lectureId);
}

class TopicRepositoryImpl implements TopicRepository {
  final db.AppDatabase _database;
  TopicRepositoryImpl(this._database);

  @override
  Future<List<Topic>> getByLectureId(int lectureId) async {
    final rows = await (_database.select(_database.topics)
          ..where((t) => t.lectureId.equals(lectureId))
          ..orderBy([(t) => OrderingTerm(
                expression: t.startSeconds, mode: OrderingMode.asc)]))
        .get();
    return rows.map(_toDomain).toList();
  }

  @override
  Future<void> saveTopics(int lectureId, List<Topic> topics) async {
    final now = DateTime.now();
    await _database.batch((batch) {
      batch.deleteWhere(
          _database.topics, (t) => t.lectureId.equals(lectureId));

      for (final topic in topics) {
        batch.insert(_database.topics, db.TopicsCompanion(
          lectureId: Value(lectureId),
          startSeconds: Value(topic.startSeconds),
          endSeconds: Value(topic.endSeconds),
          title: Value(topic.title),
          summary: Value(topic.summary),
          importance: Value(topic.importance),
          keywordsJson: Value(jsonEncode(topic.keywords)),
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
    await (_database.delete(_database.topics)
          ..where((t) => t.lectureId.equals(lectureId)))
        .go();
  }

  Topic _toDomain(db.Topic row) {
    return Topic(
      id: row.id,
      remoteId: row.remoteId,
      lectureId: row.lectureId,
      startSeconds: row.startSeconds,
      endSeconds: row.endSeconds,
      title: row.title,
      summary: row.summary,
      importance: row.importance,
      keywords: _parseKeywords(row.keywordsJson),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  List<String> _parseKeywords(String json) {
    try {
      final list = jsonDecode(json) as List<dynamic>;
      return list.map((e) => e.toString()).toList();
    } catch (_) {
      return [];
    }
  }
}

final summaryRepositoryProvider = Provider<SummaryRepository>((ref) {
  final database = ref.watch(db.appDatabaseProvider);
  return SummaryRepositoryImpl(database);
});

abstract class SummaryRepository {
  Future<LectureSummary?> getByLectureId(int lectureId);
  Future<void> saveSummary(int lectureId, LectureSummary summary);
}

class SummaryRepositoryImpl implements SummaryRepository {
  final db.AppDatabase _db;
  SummaryRepositoryImpl(this._db);

  @override
  Future<LectureSummary?> getByLectureId(int lectureId) async {
    final row = await (_db.select(_db.lectureSummaries)
          ..where((t) => t.lectureId.equals(lectureId)))
        .getSingleOrNull();
    if (row == null) return null;
    return _toDomain(row);
  }

  @override
  Future<void> saveSummary(int lectureId, LectureSummary summary) async {
    final now = DateTime.now();
    await _db.into(_db.lectureSummaries).insert(
          db.LectureSummariesCompanion(
            lectureId: Value(lectureId),
            overallSummary: Value(summary.overallSummary),
            reviewPointsJson: Value(jsonEncode(summary.reviewPoints)),
            examPointsJson: Value(jsonEncode(summary.examPoints)),
            keywordsJson: Value(jsonEncode(summary.keywords
                .map((k) => {'word': k.word, 'explanation': k.explanation})
                .toList())),
            createdAt: Value(now),
            updatedAt: Value(now),
            syncStatus: const Value('localOnly'),
            deviceId: const Value(''),
          ),
          mode: InsertMode.replace,
        );
  }

  LectureSummary _toDomain(db.LectureSummary row) {
    return LectureSummary(
      id: row.id,
      lectureId: row.lectureId,
      remoteId: row.remoteId,
      overallSummary: row.overallSummary,
      reviewPoints: _parseStringList(row.reviewPointsJson),
      examPoints: _parseStringList(row.examPointsJson),
      keywords: _parseKeywords(row.keywordsJson),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  List<String> _parseStringList(String json) {
    try {
      final list = jsonDecode(json) as List<dynamic>;
      return list.map((e) => e.toString()).toList();
    } catch (_) {
      return [];
    }
  }

  List<KeywordExplanation> _parseKeywords(String json) {
    try {
      final list = jsonDecode(json) as List<dynamic>;
      return list.map((e) {
        final m = e as Map<String, dynamic>;
        return KeywordExplanation(
          word: m['word'] as String? ?? '',
          explanation: m['explanation'] as String? ?? '',
        );
      }).toList();
    } catch (_) {
      return [];
    }
  }
}