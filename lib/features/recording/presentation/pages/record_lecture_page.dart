import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/glass_button.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/glass_scaffold.dart';
import '../../application/recording_notifier.dart';
import '../../domain/recording_service_interface.dart';

class RecordLecturePage extends ConsumerStatefulWidget {
  const RecordLecturePage({super.key});

  @override
  ConsumerState<RecordLecturePage> createState() => _RecordLecturePageState();
}

class _RecordLecturePageState extends ConsumerState<RecordLecturePage>
    with SingleTickerProviderStateMixin {
  final _titleController = TextEditingController();
  late final AnimationController _pulseController;
  bool _wasRecording = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(recordingNotifierProvider);
    final theme = Theme.of(context);
    final isRecording = uiState.recordingState == RecordingState.recording;

    if (isRecording && !_wasRecording) {
      _pulseController.repeat(reverse: true);
    } else if (!isRecording && _wasRecording) {
      _pulseController.stop();
      _pulseController.reset();
    }
    _wasRecording = isRecording;

    return GlassScaffold(
      appBar: AppBar(title: const Text('録音')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GlassCard(
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: '講義タイトル',
                      hintText: '例: 情報工学 第10回',
                    ),
                    onChanged: (v) {
                      ref.read(recordingNotifierProvider.notifier).setTitle(v);
                    },
                    enabled: !isRecording,
                  ),
                  const SizedBox(height: 24),
                  _buildRecordingIndicator(isRecording, theme),
                  const SizedBox(height: 24),
                  _buildDurationDisplay(uiState, theme),
                  const SizedBox(height: 24),
                  _buildControls(uiState, isRecording),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (uiState.isSaving)
              const LinearProgressIndicator(),
            if (uiState.lectureId != null)
              GlassCard(
                child: Column(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 48),
                    const SizedBox(height: 8),
                    Text('保存完了', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('講義ID: ${uiState.lectureId}'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordingIndicator(bool isRecording, ThemeData theme) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isRecording
            ? Colors.red.withValues(alpha: 0.2)
            : theme.colorScheme.surfaceContainerHighest,
        border: Border.all(
          color: isRecording ? Colors.red : theme.colorScheme.outline,
          width: 3,
        ),
      ),
      child: Center(
        child: isRecording
            ? AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Container(
                    width: 24 + _pulseController.value * 16,
                    height: 24 + _pulseController.value * 16,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  );
                },
              )
            : Icon(Icons.mic, size: 36, color: theme.colorScheme.onSurface),
      ),
    );
  }

  Widget _buildDurationDisplay(RecordingUIState state, ThemeData theme) {
    final elapsed = state.elapsed;
    final minutes = elapsed.inMinutes.remainder(60);
    final seconds = elapsed.inSeconds.remainder(60);
    return Text(
      '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
      style: theme.textTheme.headlineLarge?.copyWith(
        fontFeatures: const [FontFeature.tabularFigures()],
      ),
    );
  }

  Widget _buildControls(RecordingUIState state, bool isRecording) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!isRecording) ...[
          GlassButton(
            label: '録音開始',
            icon: Icons.mic,
            onPressed: () {
              ref.read(recordingNotifierProvider.notifier).startRecording();
            },
          ),
        ] else ...[
          GlassButton(
            label: '停止して保存',
            icon: Icons.stop,
            onPressed: () async {
              await ref
                  .read(recordingNotifierProvider.notifier)
                  .stopRecordingAndSave();
            },
            backgroundColor: Colors.red,
          ),
          const SizedBox(width: 16),
          GlassButton(
            label: 'キャンセル',
            onPressed: () {
              ref.read(recordingNotifierProvider.notifier).cancel();
            },
          ),
        ],
      ],
    );
  }
}
