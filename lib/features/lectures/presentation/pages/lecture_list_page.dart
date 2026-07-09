import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_radius.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/glass_text_field.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../application/lecture_notifier.dart';
import '../../application/lecture_state.dart';
import '../../domain/lecture.dart';

class LectureListPage extends ConsumerStatefulWidget {
  const LectureListPage({super.key});

  @override
  ConsumerState<LectureListPage> createState() => _LectureListPageState();
}

class _LectureListPageState extends ConsumerState<LectureListPage> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(lectureStateProvider.notifier).loadLectures();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(lectureStateProvider);
    final lectures = state.lectures;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const SizedBox(height: AppSpacing.lg),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Row(
              children: [
                Expanded(
                  child: GlassTextField(
                    controller: _searchController,
                    hintText: '講義を検索...',
                    prefixIcon: Icons.search_rounded,
                    onChanged: (value) {
                      setState(() => _searchQuery = value);
                    },
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                _GlassIconButton(
                  icon: Icons.filter_list_rounded,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Expanded(
            child: LoadingOverlay(
              isLoading: state.loadState == LectureLoadState.loading,
              message: '読み込み中...',
              child: _buildLectureList(lectures),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-lecture'),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add_rounded, color: Colors.white),
      ),
    );
  }

  Widget _buildLectureList(List<Lecture> lectures) {
    final filtered = _searchQuery.isEmpty
        ? lectures
        : lectures
            .where((l) =>
                l.title.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();

    if (filtered.isEmpty) {
      return const EmptyState(
        icon: Icons.menu_book_rounded,
        title: '講義がありません',
        subtitle: '右下の+ボタンから音声ファイルを追加してください',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final lecture = filtered[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: _LectureCard(
            lecture: lecture,
            onTap: () => context.push('/lectures/${lecture.id}'),
          ),
        );
      },
    );
  }
}

class _LectureCard extends StatelessWidget {
  final Lecture lecture;
  final VoidCallback onTap;

  const _LectureCard({required this.lecture, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  lecture.title,
                  style: AppTypography.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  StatusBadge.transcription(lecture.transcriptionStatus),
                  const SizedBox(height: 4),
                  StatusBadge.summary(lecture.summaryStatus),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              _InfoChip(
                icon: Icons.calendar_today,
                text:
                    '${lecture.createdAt.year}/${lecture.createdAt.month}/${lecture.createdAt.day}',
              ),
              const SizedBox(width: AppSpacing.sm),
              _InfoChip(
                icon: Icons.access_time,
                text: lecture.formattedDuration,
              ),
              const Spacer(),
              StatusBadge.sync(lecture.syncStatus),
              const SizedBox(width: 4),
              StatusBadge.obsidian(lecture.obsidianExportStatus),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: AppColors.textTertiary),
        const SizedBox(width: 4),
        Text(text, style: AppTypography.bodySmall),
      ],
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double size = 40;

  const _GlassIconButton({
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceGlass,
      borderRadius: BorderRadius.circular(AppRadius.sm),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            border: Border.all(color: AppColors.borderGlass),
          ),
          child: Icon(icon, size: 20, color: AppColors.textPrimary),
        ),
      ),
    );
  }
}