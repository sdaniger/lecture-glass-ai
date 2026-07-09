import 'package:drift/drift.dart';

class ExportLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get lectureId => integer()();
  TextColumn get target => text()();
  TextColumn get filePath => text()();
  DateTimeColumn get exportedAt => dateTime()();
  TextColumn get status => text()();
  TextColumn get errorMessage => text().nullable()();
}
