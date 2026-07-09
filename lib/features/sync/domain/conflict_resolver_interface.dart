class ConflictInfo {
  final int localId;
  final String? remoteId;
  final String entityType;
  final DateTime localUpdatedAt;
  final DateTime remoteUpdatedAt;
  final Map<String, dynamic> localValues;
  final Map<String, dynamic> remoteValues;

  const ConflictInfo({
    required this.localId,
    this.remoteId,
    required this.entityType,
    required this.localUpdatedAt,
    required this.remoteUpdatedAt,
    required this.localValues,
    required this.remoteValues,
  });
}

enum ConflictResolution {
  useLocal,
  useRemote,
  markConflict,
}

abstract class ConflictResolver {
  ConflictResolution resolve(ConflictInfo conflict);
}
