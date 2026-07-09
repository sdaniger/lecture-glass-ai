import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_typography.dart';

class ProgressStep {
  final String label;
  final bool isCompleted;
  final bool isActive;
  final String? errorMessage;

  const ProgressStep({
    required this.label,
    this.isCompleted = false,
    this.isActive = false,
    this.errorMessage,
  });
}

class ProgressStepIndicator extends StatelessWidget {
  final List<ProgressStep> steps;

  const ProgressStepIndicator({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final isLast = index == steps.length - 1;
        return _StepItem(
          step: step,
          isLast: isLast,
        );
      }),
    );
  }
}

class _StepItem extends StatelessWidget {
  final ProgressStep step;
  final bool isLast;

  const _StepItem({
    required this.step,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            child: Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: step.isCompleted
                        ? AppColors.success
                        : step.isActive
                            ? AppColors.primary
                            : AppColors.surfaceGlass,
                    border: step.isActive
                        ? Border.all(color: AppColors.primary, width: 2)
                        : null,
                  ),
                  child: step.isCompleted
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : step.isActive
                          ? const SizedBox(
                              width: 8,
                              height: 8,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.primary,
                              ),
                            )
                          : null,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1,
                      color: AppColors.borderGlass,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 3),
                  Text(
                    step.label,
                    style: AppTypography.bodyMedium.copyWith(
                      color: step.isCompleted
                          ? AppColors.success
                          : step.isActive
                              ? AppColors.textPrimary
                              : AppColors.textTertiary,
                    ),
                  ),
                  if (step.errorMessage != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      step.errorMessage!,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
