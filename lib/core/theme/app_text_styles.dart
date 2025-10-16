import 'dart:ui';

import 'package:micro_habits/core/theme/app_font.dart';

class AppTextStyles {
  static final TextStyle bodyMedium = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodyLarge = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle titleMedium = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle titleLarge = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle titleSmall = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle button = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
