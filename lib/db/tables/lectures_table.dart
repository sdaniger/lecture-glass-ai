import 'package:drift/drift.dart';

class Lectures extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get remoteId => text().nullable()();
  TextColumn get title => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('localOnly'))();
  TextColumn get deviceId => text()();
  IntColumn get version => integer().withDefault(const Constant(1))();
  TextColumn get audioPath => text().nullable()();
  TextColumn get wavPath => text().nullable()();
  RealColumn get durationSeconds => real().nullable()();
  TextColumn get transcriptionStatus =>
      text().withDefault(const Constant('notStarted'))();
  TextColumn get summaryStatus =>
      text().withDefault(const Constant('notStarted'))();
  TextColumn get obsidianExportStatus =>
      text().withDefault(const Constant('notExported'))();
}
