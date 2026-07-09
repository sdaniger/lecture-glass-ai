enum SyncStatus {
  idle,
  syncing,
  success,
  error,
  partial,
}

abstract class SyncService {
  SyncStatus get status;
  String? get lastErrorMessage;
  DateTime? get lastSyncAt;

  Future<void> fullSync({required String deviceId});
  Future<void> syncLecture({required int lectureId, required String deviceId});
  Future<void> cancelSync();
  Stream<SyncStatus> watchStatus();
}
