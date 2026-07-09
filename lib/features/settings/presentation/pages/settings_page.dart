import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../app/theme/theme_provider.dart';
import '../../../../shared/widgets/glass_button.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/glass_text_field.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../../data/llm_settings_repository.dart';
import '../../domain/llm_provider.dart';
import '../../domain/llm_settings.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final _formKey = GlobalKey<FormState>();
  final _apiKeyController = TextEditingController();
  final _modelController = TextEditingController();
  final _baseUrlController = TextEditingController();

  LlmProvider _provider = LlmProvider.groq;
  bool _isLoading = true;
  bool _isSaving = false;
  String? _errorMessage;
  String? _successMessage;

  @override
  void initState() {
    super.initState();
    Future.microtask(_loadSettings);
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    _modelController.dispose();
    _baseUrlController.dispose();
    super.dispose();
  }

  Future<void> _loadSettings() async {
    final settings = await ref.read(llmSettingsRepositoryProvider).load();
    if (!mounted) return;

    setState(() {
      _provider = settings.provider;
      _apiKeyController.text = settings.apiKey;
      _modelController.text = settings.modelName;
      _baseUrlController.text = settings.baseUrl;
      _isLoading = false;
    });
  }

  void _applyProviderPreset(LlmProvider nextProvider) {
    final previousProvider = _provider;
    setState(() {
      _provider = nextProvider;

      if (_modelController.text.trim().isEmpty ||
          _modelController.text == previousProvider.defaultModel) {
        _modelController.text = nextProvider.defaultModel;
      }

      if (_baseUrlController.text.trim().isEmpty ||
          _baseUrlController.text == previousProvider.defaultBaseUrl) {
        _baseUrlController.text = nextProvider.defaultBaseUrl;
      }

      _errorMessage = null;
      _successMessage = null;
    });
  }

  Future<void> _saveSettings() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSaving = true;
      _errorMessage = null;
      _successMessage = null;
    });

    try {
      final settings = LlmSettings(
        provider: _provider,
        apiKey: _apiKeyController.text.trim(),
        modelName: _modelController.text.trim(),
        baseUrl: _baseUrlController.text.trim(),
      );
      await ref.read(llmSettingsRepositoryProvider).save(settings);

      if (!mounted) return;
      setState(() {
        _successMessage = '設定を保存しました';
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = '設定の保存に失敗しました: $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  void _resetToDefaults() {
    setState(() {
      _provider = LlmProvider.groq;
      _apiKeyController.clear();
      _modelController.text = LlmProvider.groq.defaultModel;
      _baseUrlController.text = LlmProvider.groq.defaultBaseUrl;
      _errorMessage = null;
      _successMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Text('設定', style: AppTypography.displayMedium),
          const SizedBox(height: AppSpacing.lg),

          _SectionHeader(title: 'AI API設定', icon: Icons.api_rounded),
          const SizedBox(height: AppSpacing.sm),
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: _isLoading
                ? const SizedBox(
                    height: 160,
                    child: Center(child: CircularProgressIndicator()),
                  )
                : Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonFormField<LlmProvider>(
                          value: _provider,
                          decoration: const InputDecoration(
                            labelText: 'APIプロバイダ',
                          ),
                          items: LlmProvider.values
                              .map(
                                (provider) => DropdownMenuItem(
                                  value: provider,
                                  child: Text(provider.label),
                                ),
                              )
                              .toList(),
                          onChanged: (provider) {
                            if (provider == null) return;
                            _applyProviderPreset(provider);
                          },
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          _provider.description,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        GlassTextField(
                          controller: _apiKeyController,
                          hintText: _provider == LlmProvider.gemini
                              ? 'AIza...'
                              : 'sk-...',
                          labelText: 'APIキー',
                          prefixIcon: Icons.key_rounded,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'APIキーを入力してください';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        GlassTextField(
                          controller: _modelController,
                          hintText: _provider.defaultModel,
                          labelText: 'モデル名',
                          prefixIcon: Icons.smart_toy_rounded,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'モデル名を入力してください';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        GlassTextField(
                          controller: _baseUrlController,
                          hintText: _provider.defaultBaseUrl,
                          labelText: 'APIベースURL',
                          prefixIcon: Icons.link_rounded,
                          validator: (value) {
                            if (_provider == LlmProvider.m365Proxy &&
                                (value == null || value.trim().isEmpty)) {
                              return 'M365 Proxy のベースURLを入力してください';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        GlassCard(
                          padding: const EdgeInsets.all(AppSpacing.sm),
                          color: AppColors.surfaceGlass.withValues(alpha: 0.6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                _provider.isGemini
                                    ? Icons.auto_awesome_rounded
                                    : Icons.cloud_rounded,
                                size: 18,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: Text(
                                  _provider.isGemini
                                      ? 'Gemini は Google の生成APIを直接利用します。JSONで返すように強制しています。'
                                      : 'Groq / OpenRouter / M365 Proxy は OpenAI互換の chat/completions を使います。',
                                  style: AppTypography.bodySmall.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        if (_errorMessage != null)
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: AppSpacing.sm),
                            child: Text(
                              _errorMessage!,
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.error,
                              ),
                            ),
                          ),
                        if (_successMessage != null)
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: AppSpacing.sm),
                            child: Text(
                              _successMessage!,
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        Row(
                          children: [
                            Expanded(
                              child: GlassButton(
                                label: _isSaving ? '保存中...' : '保存',
                                icon: _isSaving ? null : Icons.save_rounded,
                                onPressed: _isSaving ? null : _saveSettings,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            GlassButton(
                              label: '初期値に戻す',
                              icon: Icons.restart_alt_rounded,
                              onPressed: _isSaving ? null : _resetToDefaults,
                              backgroundColor:
                                  AppColors.surfaceGlass.withValues(alpha: 0.6),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
          const SizedBox(height: AppSpacing.lg),

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
          Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          Text(value, style: AppTypography.bodyMedium),
        ],
      ),
    );
  }
}
