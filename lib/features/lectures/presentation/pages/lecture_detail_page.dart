import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_radius.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/glass_button.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../../../../shared/widgets/responsive_shell.dart';

class LectureDetailPage extends ConsumerStatefulWidget {
  final int lectureId;

  const LectureDetailPage({super.key, required this.lectureId});

  @override
  ConsumerState<LectureDetailPage> createState() => _LectureDetailPageState();
}

class _LectureDetailPageState extends ConsumerState<LectureDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWide = ResponsiveShell.isWide(context);

    return Column(
      children: [
        // Header
        Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.md,
            AppSpacing.md,
            0,
          ),
          child: Row(
            children: [
              if (!isWide)
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.textPrimary,
                  ),
                ),
              if (!isWide) const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'ディジタル回路 第3回',
                  style: AppTypography.headlineMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),

        // Status row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Row(
            children: [
              StatusBadge.transcription('completed'),
              const SizedBox(width: AppSpacing.sm),
              StatusBadge.summary('completed'),
              const SizedBox(width: AppSpacing.sm),
              StatusBadge.sync('synced'),
              const SizedBox(width: AppSpacing.sm),
              StatusBadge.obsidian('exported'),
              const Spacer(),
              _InfoLabel(
                icon: Icons.access_time,
                text: '60:00',
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),

        // Tab bar
        Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.surfaceGlass,
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child: TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            dividerColor: Colors.transparent,
            labelColor: AppColors.textPrimary,
            unselectedLabelColor: AppColors.textTertiary,
            tabs: const [
              Tab(text: '概要'),
              Tab(text: 'タイムライン'),
              Tab(text: 'トピック'),
              Tab(text: 'ノート'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),

        // Tab content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _OverviewTab(),
              _TimelineTabPlaceholder(),
              _TopicsTabPlaceholder(),
              _NoteTabPlaceholder(),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoLabel extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoLabel({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text(text, style: AppTypography.bodySmall),
      ],
    );
  }
}

class _OverviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  'この講義では、論理ゲートと真理値表の基本を扱った。'
                  '前半では前回の復習として2進数と基本的な論理演算について確認し、'
                  '後半ではAND、OR、NOTゲートの動作と真理値表の作成方法について詳しく解説した。'
                  'また、複数のゲートを組み合わせた回路の解析方法についても触れた。',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          GlassCard(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star_rounded, size: 18, color: AppColors.warning),
                    const SizedBox(width: 8),
                    Text('重要話題', style: AppTypography.titleMedium),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                _TopicRow(
                  time: '00:00 - 08:20',
                  title: '前回の復習',
                  importance: 3,
                ),
                const Divider(color: AppColors.borderGlass),
                _TopicRow(
                  time: '08:21 - 22:10',
                  title: '論理ゲート',
                  importance: 5,
                ),
                const Divider(color: AppColors.borderGlass),
                _TopicRow(
                  time: '22:11 - 40:30',
                  title: '真理値表',
                  importance: 5,
                ),
                const Divider(color: AppColors.borderGlass),
                _TopicRow(
                  time: '40:31 - 60:00',
                  title: 'カルノー図',
                  importance: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
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
                _BulletPoint('ANDとORの違いを説明できるようにする'),
                _BulletPoint('真理値表を自分で作れるようにする'),
                _BulletPoint('カルノー図を用いた論理式の簡単化を練習する'),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          GlassButton(
            label: '全文を表示',
            icon: Icons.open_in_full,
            onPressed: () {},
          ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }
}

class _TopicRow extends StatelessWidget {
  final String time;
  final String title;
  final int importance;

  const _TopicRow({
    required this.time,
    required this.title,
    required this.importance,
  });

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
              time,
              style: AppTypography.mono.copyWith(fontSize: 11),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(title, style: AppTypography.bodyMedium),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: _importanceColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(AppRadius.xs),
            ),
            child: Text(
              '重要度 $importance',
              style: AppTypography.bodySmall.copyWith(
                color: _importanceColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color get _importanceColor {
    if (importance >= 5) return AppColors.error;
    if (importance >= 4) return AppColors.warning;
    return AppColors.textSecondary;
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('● ', style: AppTypography.bodyMedium.copyWith(
            color: AppColors.primary,
          )),
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

class _TimelineTabPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('タイムライン（後日実装）', style: TextStyle(color: AppColors.textTertiary)),
    );
  }
}

class _TopicsTabPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('トピック一覧（後日実装）', style: TextStyle(color: AppColors.textTertiary)),
    );
  }
}

class _NoteTabPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('ノート（後日実装）', style: TextStyle(color: AppColors.textTertiary)),
    );
  }
}
