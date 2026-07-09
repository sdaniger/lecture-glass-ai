import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../app/theme/theme_provider.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/glass_button.dart';
import '../../../../shared/widgets/glass_text_field.dart';
import '../../../../shared/widgets/status_badge.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Text('設定', style: AppTypography.displayMedium),
          const SizedBox(height: AppSpacing.lg),

          // LLM API Settings
          _SectionHeader(title: 'AI API設定', icon: Icons.api_rounded),
          const SizedBox(height: AppSpacing.sm),
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                GlassTextField(
                  hintText: 'sk-...',
                  labelText: 'APIキー',
                  prefixIcon: Icons.key_rounded,
                  obscureText: true,
                ),
                const SizedBox(height: AppSpacing.sm),
                GlassTextField(
                  hintText: 'gpt-4o-mini',
                  labelText: 'モデル名',
                  prefixIcon: Icons.smart_toy_rounded,
                ),
                const SizedBox(height: AppSpacing.sm),
                GlassTextField(
                  hintText: 'https://api.openai.com/v1',
                  labelText: 'APIベースURL',
                  prefixIcon: Icons.link_rounded,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Whisper Settings
          _SectionHeader(title: 'Whisper設定', icon: Icons.transcribe_rounded),
          const SizedBox(height: AppSpacing.sm),
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('モデル状態', style: AppTypography.titleMedium),
                    const SizedBox(width: AppSpacing.sm),
                    StatusBadge(label: '未ダウンロード', color: AppColors.warning),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  '文字起こしにはWhisperモデルファイルが必要です。'
                  'アプリ起動時に自動ダウンロードするか、手動で配置してください。',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                GlassButton(
                  label: 'モデルをダウンロード',
                  icon: Icons.download_rounded,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Theme Settings
          _SectionHeader(title: 'テーマ', icon: Icons.palette_rounded),
          const SizedBox(height: AppSpacing.sm),
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile<ThemeMode>(
                  title: const Text('ダーク'),
                  value: ThemeMode.dark,
                  groupValue: themeMode,
                  onChanged: (v) {
                    ref.read(themeModeProvider.notifier).state = v!;
                  },
                ),
                RadioListTile<ThemeMode>(
                  title: const Text('ライト'),
                  value: ThemeMode.light,
                  groupValue: themeMode,
                  onChanged: (v) {
                    ref.read(themeModeProvider.notifier).state = v!;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Data Management
          _SectionHeader(title: 'データ管理', icon: Icons.storage_rounded),
          const SizedBox(height: AppSpacing.sm),
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                _DataRow(label: 'データベースサイズ', value: '2.3 MB'),
                const Divider(color: AppColors.borderGlass),
                _DataRow(label: '音声ファイル保存先', value: 'アプリ内部'),
                const Divider(color: AppColors.borderGlass),
                _DataRow(label: '対応音声形式', value: 'wav, m4a, mp3, webm, mp4'),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          GlassButton(
            label: 'データをエクスポート',
            icon: Icons.file_download_outlined,
            onPressed: () {},
            backgroundColor: AppColors.surfaceGlass,
          ),
          const SizedBox(height: AppSpacing.md),
          GlassButton(
            label: 'すべてのデータを削除',
            icon: Icons.delete_outline,
            onPressed: () {},
            backgroundColor: AppColors.error.withValues(alpha: 0.2),
            foregroundColor: AppColors.error,
          ),
          const SizedBox(height: AppSpacing.lg),

          // App Info
          _SectionHeader(title: 'アプリ情報', icon: Icons.info_outline),
          const SizedBox(height: AppSpacing.sm),
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                _DataRow(label: 'アプリ名', value: 'LectureGlass AI'),
                const Divider(color: AppColors.borderGlass),
                _DataRow(label: 'バージョン', value: '1.0.0'),
                const Divider(color: AppColors.borderGlass),
                _DataRow(label: 'プラットフォーム', value: 'Android / Windows'),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Text(title, style: AppTypography.titleMedium),
      ],
    );
  }
}

class _DataRow extends StatelessWidget {
  final String label;
  final String value;

  const _DataRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          )),
          Text(value, style: AppTypography.bodyMedium),
        ],
      ),
    );
  }
}
