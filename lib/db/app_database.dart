import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'tables/lectures_table.dart';
import 'tables/transcript_segments_table.dart';
import 'tables/topics_table.dart';
import 'tables/lecture_summaries_table.dart';
import 'tables/sync_queue_table.dart';
import 'tables/export_logs_table.dart';
import 'tables/app_settings_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Lectures,
    TranscriptSegments,
    Topics,
    LectureSummaries,
    SyncQueue,
    ExportLogs,
    AppSettings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final file = File(p.join(dir.path, 'lecture_glass.sqlite'));
    return NativeDatabase(file);
  });
}

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});