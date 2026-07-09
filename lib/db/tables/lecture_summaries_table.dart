import 'package:drift/drift.dart';

class LectureSummaries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get lectureId => integer()();
  TextColumn get remoteId => text().nullable()();
  TextColumn get overallSummary => text()();
  TextColumn get reviewPointsJson => text()();
  TextColumn get examPointsJson => text()();
  TextColumn get keywordsJson => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('localOnly'))();
  TextColumn get deviceId => text()();
  IntColumn get version => integer().withDefault(const Constant(1))();
}
