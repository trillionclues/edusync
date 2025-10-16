import 'package:flutter/material.dart';
import 'package:micro_habits/core/theme/app_colors.dart';
import 'package:micro_habits/core/theme/app_text_styles.dart';

class AppTheme {
  static ThemeData getThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        titleMedium: AppTextStyles.titleMedium,
        titleLarge: AppTextStyles.titleLarge,
        titleSmall: AppTextStyles.titleSmall,
        bodyMedium: AppTextStyles.bodyMedium,
        bodyLarge: AppTextStyles.bodyLarge,
        bodySmall: AppTextStyles.bodySmall,
      ),
      colorScheme: const ColorScheme(
        primary: AppColors.primary,
        onPrimary: AppColors.background,
        secondary: AppColors.secondary,
        onSecondary: AppColors.background,
        error: AppColors.errorColor,
        onError: AppColors.errorColor,
        surface: AppColors.background,
        onSurface: AppColors.textColor,
        brightness: Brightness.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.background,
          elevation: 0,
          disabledBackgroundColor: AppColors.primary.withOpacity(0.3),
        ),
      ),
    );
  }
}
