import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_radius.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/glass_button.dart';

class ObsidianSettingsPage extends ConsumerWidget {
  const ObsidianSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Text('Obsidian連携', style: AppTypography.displayMedium),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '講義ノートをMarkdownとしてObsidian Vaultへ出力します',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Main toggle
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Obsidian連携', style: AppTypography.titleMedium),
                Switch(
                  value: false,
                  onChanged: (_) {},
                  activeColor: AppColors.primary,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // Vault folder
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Vaultフォルダ', style: AppTypography.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceGlass,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    border: Border.all(color: AppColors.borderGlass),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.folder_open_rounded,
                          size: 20, color: AppColors.textTertiary),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          'フォルダが選択されていません',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('選択', style: TextStyle(color: AppColors.primary)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // Output settings
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('自動エクスポート', style: AppTypography.bodyMedium),
                    Switch(
                      value: false,
                      onChanged: (_) {},
                      activeColor: AppColors.primary,
                    ),
                  ],
                ),
                const Divider(color: AppColors.borderGlass),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('保存後にObsidianで開く', style: AppTypography.bodyMedium),
                    Switch(
                      value: true,
                      onChanged: (_) {},
                      activeColor: AppColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // Conflict resolution
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('既存ファイルの処理', style: AppTypography.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                _OptionChip(label: '上書き', isSelected: true),
                const SizedBox(width: AppSpacing.sm),
                _OptionChip(label: '追記', isSelected: false),
                const SizedBox(width: AppSpacing.sm),
                _OptionChip(label: 'スキップ', isSelected: false),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          GlassButton(
            label: 'テスト出力',
            icon: Icons.play_arrow_rounded,
            onPressed: () {},
          ),
          const SizedBox(height: AppSpacing.md),

          // Status
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: _SyncInfoRow(label: '最終出力日時', value: '--'),
          ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }
}

class _OptionChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _OptionChip({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) {},
      selectedColor: AppColors.primary.withValues(alpha: 0.3),
      backgroundColor: AppColors.surfaceGlass,
      labelStyle: TextStyle(
        color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
        fontSize: 13,
      ),
      side: BorderSide(
        color: isSelected ? AppColors.primary : AppColors.borderGlass,
      ),
    );
  }
}

class _SyncInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _SyncInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTypography.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        )),
        Text(value, style: AppTypography.bodyMedium),
      ],
    );
  }
}
