import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_radius.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/glass_scaffold.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/glass_button.dart';
import '../../../../shared/widgets/glass_text_field.dart';
import '../../../../shared/widgets/progress_step_indicator.dart';
import '../../../../core/errors.dart';
import '../../application/lecture_notifier.dart';
import '../../../transcription/data/audio_storage_service.dart';

class AddLecturePage extends ConsumerStatefulWidget {
  const AddLecturePage({super.key});

  @override
  ConsumerState<AddLecturePage> createState() => _AddLecturePageState();
}

class _AddLecturePageState extends ConsumerState<AddLecturePage> {
  final _titleController = TextEditingController();
  String? _selectedFilePath;
  String? _selectedFileName;
  bool _isProcessing = false;
  String? _errorMessage;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _pickAudioFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['wav', 'm4a', 'mp3', 'webm', 'mp4'],
    );

    if (result != null && result.files.single.path != null) {
      final path = result.files.single.path!;
      final name = result.files.single.name;
      setState(() {
        _selectedFilePath = path;
        _selectedFileName = name;
        _errorMessage = null;
      });
      if (_titleController.text.isEmpty) {
        _titleController.text = name.replaceAll(RegExp(r'\.[^.]+$'), '');
      }
    }
  }

  Future<void> _saveLecture() async {
    if (_selectedFilePath == null) {
      setState(() => _errorMessage = '音声ファイルを選択してください');
      return;
    }
    if (_titleController.text.trim().isEmpty) {
      setState(() => _errorMessage = '講義タイトルを入力してください');
      return;
    }

    setState(() {
      _isProcessing = true;
      _errorMessage = null;
    });

    try {
      // Copy audio to app dir
      final audioService = ref.read(audioStorageServiceProvider);
      final destPath = await audioService.copyAudioToAppDir(
        _selectedFilePath!,
        _selectedFileName!,
      );

      // Save lecture
      final notifier = ref.read(lectureStateProvider.notifier);
      await notifier.createLecture(
        title: _titleController.text.trim(),
        audioPath: destPath,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('講義を追加しました')),
        );
        context.pop();
      }
    } catch (e) {
      setState(() {
        _errorMessage = e is AppError
            ? e.message
            : '講義の保存に失敗しました: $e';
      });
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassScaffold(
      appBar: AppBar(
        title: Text(
          '新規講義',
          style: AppTypography.titleMedium,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.md),

            // Audio file picker
            GlassCard(
              padding: const EdgeInsets.all(AppSpacing.lg),
              color: _selectedFilePath != null
                  ? AppColors.surfaceGlassStrong
                  : AppColors.surfaceGlass,
              child: InkWell(
                onTap: _pickAudioFile,
                borderRadius: BorderRadius.circular(AppRadius.md),
                child: Column(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(AppRadius.md),
                      ),
                      child: const Icon(
                        Icons.audio_file_rounded,
                        size: 32,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      _selectedFileName ?? '音声ファイルを選択',
                      style: AppTypography.titleMedium.copyWith(
                        color: _selectedFileName != null
                            ? AppColors.textPrimary
                            : AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '対応形式: wav, m4a, mp3, webm, mp4',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Title input
            GlassTextField(
              controller: _titleController,
              hintText: '例: ディジタル回路 第3回',
              labelText: '講義タイトル',
              prefixIcon: Icons.menu_book_rounded,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Privacy notice
            GlassCard(
              padding: const EdgeInsets.all(AppSpacing.md),
              color: AppColors.primary.withValues(alpha: 0.05),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.security_rounded,
                    size: 20,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      '音声はこの端末内で文字起こしされます。\n'
                      'AI要約には文字起こし後のテキストのみ送信されます。',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Processing steps preview
            Text(
              '処理ステップ',
              style: AppTypography.titleMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            ProgressStepIndicator(
              steps: [
                ProgressStep(
                  label: '音声ファイルの保存',
                  isCompleted: _selectedFilePath != null,
                  isActive: _isProcessing,
                ),
                ProgressStep(
                  label: 'Whisper用WAVへ変換',
                  isActive: _isProcessing,
                ),
                ProgressStep(
                  label: 'ローカル文字起こし',
                ),
                ProgressStep(
                  label: 'AI要約の生成',
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),

            // Error message
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: GlassCard(
                  color: AppColors.error.withValues(alpha: 0.1),
                  border: Border.all(
                    color: AppColors.error.withValues(alpha: 0.3),
                  ),
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline,
                          size: 18, color: AppColors.error),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          _errorMessage!,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Save button
            GlassButton(
              label: _isProcessing ? '保存中...' : '講義を追加',
              icon: _isProcessing ? null : Icons.add_rounded,
              isLoading: _isProcessing,
              onPressed: _isProcessing ? null : _saveLecture,
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}