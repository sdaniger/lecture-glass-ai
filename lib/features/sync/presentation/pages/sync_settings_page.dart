import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/glass_button.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/glass_scaffold.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../../application/sync_notifier.dart';
import '../../domain/sync_service_interface.dart';

class SyncSettingsPage extends ConsumerStatefulWidget {
  const SyncSettingsPage({super.key});

  @override
  ConsumerState<SyncSettingsPage> createState() => _SyncSettingsPageState();
}

class _SyncSettingsPageState extends ConsumerState<SyncSettingsPage> {
  final _urlController = TextEditingController();
  final _anonKeyController = TextEditingController();
  final _deviceIdController = TextEditingController(text: 'default-device');

  @override
  void dispose() {
    _urlController.dispose();
    _anonKeyController.dispose();
    _deviceIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final syncState = ref.watch(syncNotifierProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: AppBar(title: const Text('同期設定')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Supabase 接続設定',
                      style: theme.textTheme.titleMedium),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _urlController,
                    decoration: const InputDecoration(
                      labelText: 'Supabase URL',
                      hintText: 'https://your-project.supabase.co',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _anonKeyController,
                    decoration: const InputDecoration(
                      labelText: 'anon key',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  GlassButton(
                    label: '接続',
                    onPressed: () {
                      ref.read(syncNotifierProvider.notifier).configureSupabase(
                        url: _urlController.text.trim(),
                        publishableKey: _anonKeyController.text.trim(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ステータス', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 12),
                  _buildStatusRow('同期状態', syncState.status),
                  _buildStatusRow(
                    '最終同期',
                    syncState.lastSyncAt?.toString() ?? '--',
                  ),
                  if (syncState.lastErrorMessage != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      syncState.lastErrorMessage!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('同期操作', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _deviceIdController,
                    decoration: const InputDecoration(
                      labelText: 'デバイスID',
                    ),
                  ),
                  const SizedBox(height: 16),
                  GlassButton(
                    label: syncState.status == SyncStatus.syncing
                        ? '同期中...'
                        : '今すぐ同期',
                    onPressed: syncState.status == SyncStatus.syncing
                        ? null
                        : () {
                            ref
                                .read(syncNotifierProvider.notifier)
                                .fullSync(deviceId: _deviceIdController.text.trim());
                          },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, dynamic value) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: theme.textTheme.bodySmall),
          ),
          if (value is SyncStatus)
            StatusBadge(
              label: _statusLabel(value),
              color: _statusColor(value),
            )
          else
            Expanded(
              child: Text(
                value?.toString() ?? '',
                style: theme.textTheme.bodyMedium,
              ),
            ),
        ],
      ),
    );
  }

  String _statusLabel(SyncStatus status) {
    switch (status) {
      case SyncStatus.idle:
        return '待機中';
      case SyncStatus.syncing:
        return '同期中';
      case SyncStatus.success:
        return '完了';
      case SyncStatus.error:
        return 'エラー';
      case SyncStatus.partial:
        return '一部完了';
    }
  }

  Color _statusColor(SyncStatus status) {
    switch (status) {
      case SyncStatus.idle:
        return Colors.grey;
      case SyncStatus.syncing:
        return Colors.blue;
      case SyncStatus.success:
        return Colors.green;
      case SyncStatus.error:
        return Colors.red;
      case SyncStatus.partial:
        return Colors.orange;
    }
  }
}