import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/logger.dart';
import '../domain/conflict_resolver_interface.dart';

final conflictResolverProvider = Provider<ConflictResolver>((ref) {
  return DefaultConflictResolver();
});

class DefaultConflictResolver implements ConflictResolver {
  @override
  ConflictResolution resolve(ConflictInfo conflict) {
    // ローカルのほうが新しければローカル優先
    if (conflict.localUpdatedAt.isAfter(conflict.remoteUpdatedAt)) {
      AppLogger.i('[ConflictResolver] useLocal for ${conflict.entityType}:${conflict.localId}');
      return ConflictResolution.useLocal;
    }
    // リモートのほうが新しければリモート優先
    if (conflict.remoteUpdatedAt.isAfter(conflict.localUpdatedAt)) {
      AppLogger.i('[ConflictResolver] useRemote for ${conflict.entityType}:${conflict.localId}');
      return ConflictResolution.useRemote;
    }
    return ConflictResolution.markConflict;
  }
}
