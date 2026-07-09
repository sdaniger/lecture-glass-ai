import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_radius.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/glass_text_field.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../application/transcription_notifier.dart';
import '../../application/transcription_state.dart';
import '../../domain/transcript_segment.dart';
import '../widgets/timeline_segment_tile.dart';
import '../../../../shared/widgets/responsive_shell.dart';

class TranscriptPage extends ConsumerStatefulWidget {
  final int lectureId;

  const TranscriptPage({super.key, required this.lectureId});

  @override
  ConsumerState<TranscriptPage> createState() => _TranscriptPageState();
}

class _TranscriptPageState extends ConsumerState<TranscriptPage> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(transcriptionStateProvider(widget.lectureId).notifier)
          .loadSegments();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(transcriptionStateProvider(widget.lectureId));
    final isWide = ResponsiveShell.isWide(context);

    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: GlassTextField(
            controller: _searchController,
            hintText: '文字起こしを検索...',
            prefixIcon: Icons.search_rounded,
            onChanged: (value) => setState(() => _searchQuery = value),
          ),
        ),

        // Segments list
        Expanded(
          child: LoadingOverlay(
            isLoading: state.loadState == TranscriptionLoadState.loading,
            message: '文字起こしを読み込み中...',
            child: _buildContent(state, isWide),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(TranscriptionState state, bool isWide) {
    if (state.loadState == TranscriptionLoadState.error) {
      return Center(
        child: GlassCard(
          padding: const EdgeInsets.all(AppSpacing.lg),
          color: AppColors.error.withValues(alpha: 0.1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline,
                  size: 48, color: AppColors.error),
              const SizedBox(height: AppSpacing.sm),
              Text(
                state.errorMessage ?? 'エラーが発生しました',
                style: AppTypography.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    final filtered = _searchQuery.isEmpty
        ? state.segments
        : state.segments
            .where((s) =>
                s.text.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();

    if (filtered.isEmpty) {
      if (state.segments.isEmpty) {
        return const EmptyState(
          icon: Icons.transcribe_rounded,
          title: '文字起こしがまだありません',
          subtitle: '講義詳細から文字起こしを開始してください',
        );
      }
      return const EmptyState(
        icon: Icons.search_off_rounded,
        title: '検索結果がありません',
      );
    }

    if (isWide) {
      return _buildTwoColumnLayout(filtered, state.segments);
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        return TimelineSegmentTile(
          segment: filtered[index],
          isEven: index.isEven,
        );
      },
    );
  }

  Widget _buildTwoColumnLayout(
      List<TranscriptSegment> filtered, List<TranscriptSegment> all) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Topic overview sidebar (left)
        SizedBox(
          width: 200,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            itemCount: filtered.length > 20 ? 20 : filtered.length,
            itemBuilder: (context, index) {
              final segment = filtered[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Material(
                  color: AppColors.surfaceGlass,
                  borderRadius: BorderRadius.circular(AppRadius.xs),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppRadius.xs),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      child: Text(
                        segment.formattedStart,
                        style: AppTypography.mono.copyWith(fontSize: 11),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        VerticalDivider(width: 1, color: AppColors.borderGlass),

        // Main transcript (right)
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
            itemCount: filtered.length,
            itemBuilder: (context, index) => TimelineSegmentTile(
              segment: filtered[index],
              isEven: index.isEven,
            ),
          ),
        ),
      ],
    );
  }
}

final transcriptSegmentsForLectureProvider =
    Provider.family<List<TranscriptSegment>, int>((ref, lectureId) {
  return ref.watch(transcriptionStateProvider(lectureId)).segments;
});