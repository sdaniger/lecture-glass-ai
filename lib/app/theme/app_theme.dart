import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_radius.dart';

abstract class AppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          tertiary: AppColors.accent,
          surface: AppColors.surfaceMedium,
          error: AppColors.error,
        ),
        cardTheme: CardTheme(
          color: AppColors.surfaceGlass,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            side: const BorderSide(color: AppColors.borderGlass, width: 0.5),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.surfaceDark.withValues(alpha: 0.8),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textTertiary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.surfaceGlass,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            borderSide: const BorderSide(color: AppColors.borderGlass),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            borderSide: const BorderSide(color: AppColors.borderGlass),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'NotoSansJP',
          ),
          displayMedium: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'NotoSansJP',
          ),
          headlineLarge: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'NotoSansJP',
          ),
          headlineMedium: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'NotoSansJP',
          ),
          titleLarge: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'NotoSansJP',
          ),
          titleMedium: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'NotoSansJP',
          ),
          bodyLarge: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'NotoSansJP',
          ),
          bodyMedium: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'NotoSansJP',
          ),
          bodySmall: TextStyle(
            color: AppColors.textSecondary,
            fontFamily: 'NotoSansJP',
          ),
          labelLarge: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'NotoSansJP',
          ),
          labelSmall: TextStyle(
            color: AppColors.textSecondary,
            fontFamily: 'NotoSansJP',
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.borderGlass,
          thickness: 0.5,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.surfaceGlass,
          selectedColor: AppColors.primary.withValues(alpha: 0.2),
          side: const BorderSide(color: AppColors.borderGlass),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
        ),
      );

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF6750A4),
          secondary: Color(0xFF625B71),
          tertiary: Color(0xFF7D5260),
          surface: Color(0xFFFEF7FF),
          error: Color(0xFFBA1A1A),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
        ),
      );
}
