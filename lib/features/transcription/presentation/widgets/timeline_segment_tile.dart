import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_radius.dart';
import '../../../../app/theme/app_typography.dart';
import '../../domain/transcript_segment.dart';

class TimelineSegmentTile extends StatelessWidget {
  final TranscriptSegment segment;
  final bool isEven;

  const TimelineSegmentTile({
    super.key,
    required this.segment,
    this.isEven = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time column
          SizedBox(
            width: 72,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.surfaceGlass,
                borderRadius: BorderRadius.circular(AppRadius.xs),
              ),
              child: Text(
                segment.formattedStart,
                style: AppTypography.mono,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),

          // Line connector
          SizedBox(
            width: 2,
            child: Container(
              color: AppColors.borderGlass,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),

          // Text content
          Expanded(
            child: Text(
              segment.text,
              style: AppTypography.bodyMedium.copyWith(
                height: 1.7,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
