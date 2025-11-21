import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: 'Poppins',
    splashColor: Colors.white,
    splashFactory: InkRipple.splashFactory,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 0,
        ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateColor.resolveWith(
          (states) => AppColors.stroke.withOpacity(.2),
        ),
        splashFactory: InkRipple.splashFactory,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateColor.resolveWith(
          (states) => AppColors.stroke.withOpacity(.2),
        ),
        splashFactory: InkRipple.splashFactory,
      ),
    ),
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      indicatorColor: AppColors.white,
      labelColor: Colors.white,
      labelStyle: AppTextStyles.textMed20,
      indicator: UnderlineTabIndicator(borderRadius: BorderRadius.circular(99)),
      unselectedLabelColor: Colors.white,
      unselectedLabelStyle: AppTextStyles.text16,
      splashFactory: InkRipple.splashFactory,
      overlayColor: WidgetStateColor.resolveWith(
        (states) => AppColors.stroke.withOpacity(.2),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: 'Poppins',
  );
}
