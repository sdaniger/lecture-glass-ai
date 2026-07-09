import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_radius.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/glass_button.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../application/summary_notifier.dart';
import '../../application/summary_state.dart';
import '../../domain/topic.dart';

class AnalysisPage extends ConsumerStatefulWidget {
  final int lectureId;

  const AnalysisPage({super.key, required this.lectureId});

  @override
  ConsumerState<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends ConsumerState<AnalysisPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(summaryStateProvider(widget.lectureId).notifier).loadSummary();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(summaryStateProvider(widget.lectureId));

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: LoadingOverlay(
        isLoading: state.loadState == SummaryLoadState.loading,
        message: '要約を読み込み中...',
        child: _buildContent(state),
      ),
    );
  }

  Widget _buildContent(SummaryState state) {
    if (state.summary == null && state.topics.isEmpty) {
      return Column(
        children: [
          const SizedBox(height: AppSpacing.xxl),
          const EmptyState(
            icon: Icons.auto_awesome_rounded,
            title: 'AI要約がまだありません',
            subtitle: '文字起こし完了後に要約を生成できます',
          ),
          const SizedBox(height: AppSpacing.lg),
          GlassButton(
            label: state.loadState == SummaryLoadState.generating
                ? '生成中...'
                : 'AI要約を生成',
            icon: state.loadState == SummaryLoadState.generating
                ? null
                : Icons.auto_awesome,
            onPressed: state.loadState == SummaryLoadState.generating
                ? null
                : () => ref
                    .read(summaryStateProvider(widget.lectureId).notifier)
                    .generateSummary(),
          ),
          if (state.errorMessage != null) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              state.errorMessage!,
              style: AppTypography.bodySmall.copyWith(color: AppColors.error),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      );
    }

    final summary = state.summary!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Overall summary
        GlassCard(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.auto_awesome, size: 18, color: AppColors.accent),
                  const SizedBox(width: 8),
                  Text('全体要約', style: AppTypography.titleMedium),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                summary.overallSummary,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.7,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),

        // Topics
        if (state.topics.isNotEmpty) ...[
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star_rounded, size: 18, color: AppColors.warning),
                    const SizedBox(width: 8),
                    Text('重要話題表', style: AppTypography.titleMedium),
                    const Spacer(),
                    Text(
                      '${state.topics.length}項目',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                ...state.topics.map((topic) => _TopicRow(topic: topic)),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
        ],

        // Review points
        if (summary.reviewPoints.isNotEmpty) ...[
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.replay_rounded, size: 18, color: AppColors.secondary),
                    const SizedBox(width: 8),
                    Text('復習ポイント', style: AppTypography.titleMedium),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                ...summary.reviewPoints
                    .map((p) => _BulletPoint(p, AppColors.secondary)),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
        ],

        // Exam points
        if (summary.examPoints.isNotEmpty) ...[
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.quiz_rounded, size: 18, color: AppColors.warning),
                    const SizedBox(width: 8),
                    Text('試験に出そうなポイント', style: AppTypography.titleMedium),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                ...summary.examPoints
                    .map((p) => _BulletPoint(p, AppColors.warning)),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
        ],

        // Keywords
        if (summary.keywords.isNotEmpty) ...[
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.menu_book_rounded, size: 18, color: AppColors.primary),
                    const SizedBox(width: 8),
                    Text('キーワード解説', style: AppTypography.titleMedium),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                ...summary.keywords.map(
                  (kw) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: GlassCard(
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      color: AppColors.surfaceDark,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kw.word,
                            style: AppTypography.titleMedium.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            kw.explanation,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
        ],

        // Obsidian export button
        GlassButton(
          label: 'Obsidianへ出力',
          icon: Icons.file_download_outlined,
          onPressed: () {},
        ),
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}

class _TopicRow extends StatelessWidget {
  final Topic topic;

  const _TopicRow({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.surfaceGlass,
              borderRadius: BorderRadius.circular(AppRadius.xs),
            ),
            child: Text(
              topic.formattedRange,
              style: AppTypography.mono.copyWith(fontSize: 11),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(topic.title, style: AppTypography.bodyMedium),
                if (topic.summary.isNotEmpty)
                  Text(
                    topic.summary,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textTertiary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          StatusBadge(
            label: '重要度 ${topic.importance}',
            color: topic.importance >= 4
                ? AppColors.error
                : topic.importance >= 3
                    ? AppColors.warning
                    : AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;
  final Color color;

  const _BulletPoint(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('● ',
              style: AppTypography.bodyMedium.copyWith(color: color)),
          Expanded(
            child: Text(
              text,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}