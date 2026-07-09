import 'package:drift/drift.dart';

class Topics extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get remoteId => text().nullable()();
  IntColumn get lectureId => integer()();
  RealColumn get startSeconds => real()();
  RealColumn get endSeconds => real()();
  TextColumn get title => text()();
  TextColumn get summary => text()();
  IntColumn get importance => integer()();
  TextColumn get keywordsJson => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('localOnly'))();
  TextColumn get deviceId => text()();
  IntColumn get version => integer().withDefault(const Constant(1))();
}
