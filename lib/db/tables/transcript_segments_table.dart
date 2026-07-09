import 'package:drift/drift.dart';

class TranscriptSegments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get remoteId => text().nullable()();
  IntColumn get lectureId => integer()();
  RealColumn get startSeconds => real()();
  RealColumn get endSeconds => real()();
  TextColumn get content => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('localOnly'))();
  TextColumn get deviceId => text()();
  IntColumn get version => integer().withDefault(const Constant(1))();
}
