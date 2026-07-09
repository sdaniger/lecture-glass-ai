import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTypography {
  static const _fontFamily = 'NotoSansJP';

  static TextStyle get displayLarge => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        fontFamily: _fontFamily,
        letterSpacing: -0.5,
      );

  static TextStyle get displayMedium => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        fontFamily: _fontFamily,
      );

  static TextStyle get headlineLarge => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        fontFamily: _fontFamily,
      );

  static TextStyle get headlineMedium => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        fontFamily: _fontFamily,
      );

  static TextStyle get titleLarge => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        fontFamily: _fontFamily,
      );

  static TextStyle get titleMedium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        fontFamily: _fontFamily,
      );

  static TextStyle get bodyLarge => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        fontFamily: _fontFamily,
        height: 1.6,
      );

  static TextStyle get bodyMedium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        fontFamily: _fontFamily,
        height: 1.5,
      );

  static TextStyle get bodySmall => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        fontFamily: _fontFamily,
      );

  static TextStyle get labelLarge => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        fontFamily: _fontFamily,
      );

  static TextStyle get labelSmall => const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        fontFamily: _fontFamily,
        letterSpacing: 0.5,
      );

  static TextStyle get mono => const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        fontFamily: 'monospace',
        height: 1.4,
      );
}
