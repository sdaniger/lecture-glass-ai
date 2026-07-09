import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_radius.dart';
import '../../app/theme/app_typography.dart';

class StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;
  final bool isSmall;

  const StatusBadge({
    super.key,
    required this.label,
    required this.color,
    this.icon,
    this.isSmall = false,
  });

  factory StatusBadge.transcription(String status) {
    return switch (status) {
      'notStarted' => StatusBadge(
          label: '未着手',
          color: AppColors.textTertiary,
        ),
      'convertingAudio' => StatusBadge(
          label: '音声変換中',
          color: AppColors.warning,
          icon: Icons.sync,
        ),
      'transcribing' => StatusBadge(
          label: '文字起こし中',
          color: AppColors.warning,
          icon: Icons.transcribe,
        ),
      'completed' => StatusBadge(
          label: '完了',
          color: AppColors.success,
          icon: Icons.check_circle_outline,
        ),
      'failed' => StatusBadge(
          label: '失敗',
          color: AppColors.error,
          icon: Icons.error_outline,
        ),
      _ => StatusBadge(label: status, color: AppColors.textTertiary),
    };
  }

  factory StatusBadge.summary(String status) {
    return switch (status) {
      'notStarted' => StatusBadge(
          label: '未要約',
          color: AppColors.textTertiary,
        ),
      'summarizingChunks' => StatusBadge(
          label: 'チャンク要約中',
          color: AppColors.warning,
          icon: Icons.auto_awesome,
        ),
      'generatingFinalSummary' => StatusBadge(
          label: '最終要約生成中',
          color: AppColors.warning,
          icon: Icons.auto_awesome,
        ),
      'completed' => StatusBadge(
          label: '要約済み',
          color: AppColors.success,
          icon: Icons.check_circle_outline,
        ),
      'failed' => StatusBadge(
          label: '失敗',
          color: AppColors.error,
          icon: Icons.error_outline,
        ),
      _ => StatusBadge(label: status, color: AppColors.textTertiary),
    };
  }

  factory StatusBadge.sync(String status) {
    return switch (status) {
      'localOnly' => StatusBadge(
          label: 'ローカル',
          color: AppColors.textTertiary,
        ),
      'pending' => StatusBadge(
          label: '未同期',
          color: AppColors.warning,
        ),
      'syncing' => StatusBadge(
          label: '同期中',
          color: AppColors.warning,
          icon: Icons.sync,
        ),
      'synced' => StatusBadge(
          label: '同期済み',
          color: AppColors.success,
          icon: Icons.cloud_done,
        ),
      'conflict' => StatusBadge(
          label: '競合',
          color: AppColors.error,
          icon: Icons.warning_amber,
        ),
      'error' => StatusBadge(
          label: 'エラー',
          color: AppColors.error,
          icon: Icons.error_outline,
        ),
      _ => StatusBadge(label: status, color: AppColors.textTertiary),
    };
  }

  factory StatusBadge.obsidian(String status) {
    return switch (status) {
      'notExported' => StatusBadge(
          label: '未出力',
          color: AppColors.textTertiary,
        ),
      'exported' => StatusBadge(
          label: '出力済み',
          color: AppColors.success,
          icon: Icons.check_circle_outline,
        ),
      'failed' => StatusBadge(
          label: '失敗',
          color: AppColors.error,
          icon: Icons.error_outline,
        ),
      _ => StatusBadge(label: status, color: AppColors.textTertiary),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 6 : 10,
        vertical: isSmall ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppRadius.xs),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: isSmall ? 12 : 14, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: (isSmall ? AppTypography.labelSmall : AppTypography.bodySmall)
                .copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
