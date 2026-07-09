import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/logger.dart';
import '../domain/sync_service_interface.dart';
import '../data/supabase_remote_repository.dart';
import '../data/sync_service.dart';

final syncNotifierProvider = NotifierProvider<SyncNotifier, SyncState>(
  SyncNotifier.new,
);

class SyncState {
  final SyncStatus status;
  final String? lastErrorMessage;
  final DateTime? lastSyncAt;
  final bool isConfigured;

  const SyncState({
    this.status = SyncStatus.idle,
    this.lastErrorMessage,
    this.lastSyncAt,
    this.isConfigured = false,
  });

  SyncState copyWith({
    SyncStatus? status,
    String? lastErrorMessage,
    DateTime? lastSyncAt,
    bool? isConfigured,
  }) {
    return SyncState(
      status: status ?? this.status,
      lastErrorMessage: lastErrorMessage ?? this.lastErrorMessage,
      lastSyncAt: lastSyncAt ?? this.lastSyncAt,
      isConfigured: isConfigured ?? this.isConfigured,
    );
  }
}

class SyncNotifier extends Notifier<SyncState> {
  StreamSubscription<SyncStatus>? _subscription;

  @override
  SyncState build() {
    final syncService = ref.watch(syncServiceProvider) as SyncServiceImpl;
    _subscription = syncService.watchStatus().listen((status) {
      state = state.copyWith(
        status: status,
        lastErrorMessage: syncService.lastErrorMessage,
        lastSyncAt: syncService.lastSyncAt,
      );
    });
    ref.onDispose(() => _subscription?.cancel());
    return const SyncState();
  }

  Future<void> configureSupabase({
    required String url,
    required String publishableKey,
  }) async {
    try {
      final remote = ref.read(remoteLectureRepositoryProvider);
      await remote.connect(url: url, publishableKey: publishableKey);
      state = state.copyWith(isConfigured: true);
    } on Exception catch (e) {
      AppLogger.e('Failed to configure Supabase', e);
      state = state.copyWith(
        status: SyncStatus.error,
        lastErrorMessage: e.toString(),
      );
    }
  }

  Future<void> fullSync({required String deviceId}) async {
    final syncService = ref.read(syncServiceProvider);
    await syncService.fullSync(deviceId: deviceId);
  }
}