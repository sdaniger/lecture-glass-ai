import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_radius.dart';

class GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final Color? color;

  const GlassIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = 40,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceGlass,
      borderRadius: BorderRadius.circular(AppRadius.sm),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        splashColor: AppColors.primary.withValues(alpha: 0.1),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            border: Border.all(color: AppColors.borderGlass, width: 0.5),
          ),
          child: Icon(
            icon,
            size: size * 0.5,
            color: color ?? AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
