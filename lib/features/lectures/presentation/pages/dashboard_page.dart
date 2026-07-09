import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../application/lecture_notifier.dart';
import '../../application/lecture_state.dart';
import '../../domain/lecture.dart';

final dashboardStatsProvider = Provider<DashboardStats>((ref) {
  final state = ref.watch(lectureStateProvider);
  final lectures = state.lectures;
  final today = DateTime.now();
  final todayStart = DateTime(today.year, today.month, today.day);

  return DashboardStats(
    totalCount: lectures.length,
    todayCount: lectures.where((l) => l.createdAt.isAfter(todayStart)).length,
    unsyncedCount: lectures.where((l) => l.syncStatus != 'synced').length,
    pendingTranscription:
        lectures.where((l) => l.transcriptionStatus == 'transcribing').length,
    pendingSummary:
        lectures.where((l) => l.summaryStatus == 'summarizingChunks' ||
                l.summaryStatus == 'generatingFinalSummary')
            .length,
    recentLectures: lectures.take(5).toList(),
  );
});

class DashboardStats {
  final int todayCount;
  final int totalCount;
  final int unsyncedCount;
  final int pendingTranscription;
  final int pendingSummary;
  final List<Lecture> recentLectures;

  const DashboardStats({
    this.todayCount = 0,
    this.totalCount = 0,
    this.unsyncedCount = 0,
    this.pendingTranscription = 0,
    this.pendingSummary = 0,
    this.recentLectures = const [],
  });
}

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final notifier = ref.read(lectureStateProvider.notifier);
      if (ref.read(lectureStateProvider).lectures.isEmpty) {
        notifier.loadLectures();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(lectureStateProvider);
    final stats = ref.watch(dashboardStatsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Text('ダッシュボード', style: AppTypography.displayMedium),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '${stats.todayCount}件の今日の講義',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Stats grid
          Row(
            children: [
              Expanded(
                  child: _StatCard(
                icon: Icons.menu_book_rounded,
                label: '全講義',
                value: '${stats.totalCount}',
                color: AppColors.primary,
              )),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                  child: _StatCard(
                icon: Icons.sync_rounded,
                label: '未同期',
                value: '${stats.unsyncedCount}',
                color: AppColors.warning,
              )),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                  child: _StatCard(
                icon: Icons.auto_awesome,
                label: '要約済み',
                value:
                    '${stats.totalCount - stats.pendingSummary}',
                color: AppColors.success,
              )),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // Recent lectures
          Text('最近の講義', style: AppTypography.headlineMedium),
          const SizedBox(height: AppSpacing.md),
          if (state.loadState == LectureLoadState.loading)
            const Center(child: CircularProgressIndicator())
          else if (stats.recentLectures.isEmpty)
            const EmptyState(
              icon: Icons.menu_book_rounded,
              title: '講義がありません',
              subtitle: '講義一覧から音声ファイルを追加してください',
            )
          else
            ...stats.recentLectures.map(
              (lecture) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: _RecentLectureCard(
                  lecture: lecture,
                  onTap: () => context.push('/lectures/${lecture.id}'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: AppSpacing.sm),
          Text(value,
              style: AppTypography.displayMedium.copyWith(color: color)),
          const SizedBox(height: 2),
          Text(label, style: AppTypography.bodySmall),
        ],
      ),
    );
  }
}

class _RecentLectureCard extends StatelessWidget {
  final Lecture lecture;
  final VoidCallback onTap;

  const _RecentLectureCard({
    required this.lecture,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  lecture.title,
                  style: AppTypography.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              StatusBadge.transcription(lecture.transcriptionStatus),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Icon(Icons.access_time,
                  size: 14, color: AppColors.textTertiary),
              const SizedBox(width: 4),
              Text(
                '${lecture.createdAt.month}/${lecture.createdAt.day}',
                style: AppTypography.bodySmall,
              ),
              const SizedBox(width: AppSpacing.md),
              Icon(Icons.music_note,
                  size: 14, color: AppColors.textTertiary),
              const SizedBox(width: 4),
              Text(lecture.formattedDuration,
                  style: AppTypography.bodySmall),
              const Spacer(),
              StatusBadge.sync(lecture.syncStatus),
              const SizedBox(width: AppSpacing.sm),
              StatusBadge.summary(lecture.summaryStatus),
            ],
          ),
        ],
      ),
    );
  }
}