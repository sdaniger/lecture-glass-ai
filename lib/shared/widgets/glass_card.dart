import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_radius.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final Color? color;
  final VoidCallback? onTap;
  final Border? border;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.color,
    this.onTap,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? AppRadius.md),
        child: Material(
          color: color ?? AppColors.surfaceGlass,
          borderRadius: BorderRadius.circular(borderRadius ?? AppRadius.md),
          child: InkWell(
            onTap: onTap,
            splashColor: AppColors.primary.withValues(alpha: 0.1),
            highlightColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                border: border ??
                    Border.all(color: AppColors.borderGlass, width: 0.5),
                borderRadius:
                    BorderRadius.circular(borderRadius ?? AppRadius.md),
              ),
              child: Padding(
                padding: padding ??
                    const EdgeInsets.all(AppSpacingDefault.md),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppSpacingDefault {
  static const md = 16.0;
}
