import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppFontFamily {
  static const karla = 'Karla';
  static const svnGilroy = 'SvnGilroy'; // Keep for backward compatibility
}

class AppTextStyles {
  AppTextStyles._();
  static TextStyle text6 = _defaultTextStyle.copyWith(fontSize: 6);

  static TextStyle text8 = _defaultTextStyle.copyWith(fontSize: 8);

  static TextStyle text10 = _defaultTextStyle.copyWith(fontSize: 10);

  static TextStyle text11 = _defaultTextStyle.copyWith(fontSize: 11);

  static TextStyle text12 = _defaultTextStyle.copyWith(fontSize: 12);

  static TextStyle text14 = _defaultTextStyle.copyWith(fontSize: 14);

  static TextStyle text15 = _defaultTextStyle.copyWith(fontSize: 15);

  static TextStyle text16 = _defaultTextStyle.copyWith(fontSize: 16);

  static TextStyle text17 = _defaultTextStyle.copyWith(fontSize: 17);

  static TextStyle text18 = _defaultTextStyle.copyWith(fontSize: 18);

  static TextStyle text20 = _defaultTextStyle.copyWith(fontSize: 20);

  static TextStyle text24 = _defaultTextStyle.copyWith(fontSize: 24);
  static TextStyle text22 = _defaultTextStyle.copyWith(fontSize: 22);

  static TextStyle text25 = _defaultTextStyle.copyWith(fontSize: 25);

  static TextStyle text28 = _defaultTextStyle.copyWith(fontSize: 28);

  static TextStyle text32 = _defaultTextStyle.copyWith(fontSize: 32);

  static TextStyle textBold6 = _defaultTextStyle.copyWith(
    fontSize: 6,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold7 = _defaultTextStyle.copyWith(
    fontSize: 7,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold8 = _defaultTextStyle.copyWith(
    fontSize: 8,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold10 = _defaultTextStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold11 = _defaultTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold12 = _defaultTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold14 = _defaultTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold15 = _defaultTextStyle.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold16 = _defaultTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold17 = _defaultTextStyle.copyWith(
    fontSize: 17,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold18 = _defaultTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold20 = _defaultTextStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold24 = _defaultTextStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold25 = _defaultTextStyle.copyWith(
    fontSize: 25,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold28 = _defaultTextStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold32 = _defaultTextStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textMed6 = _defaultTextStyle.copyWith(
    fontSize: 6,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed8 = _defaultTextStyle.copyWith(
    fontSize: 8,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed10 = _defaultTextStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed11 = _defaultTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed12 = _defaultTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textMed13 = _defaultTextStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed14 = _defaultTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed15 = _defaultTextStyle.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed16 = _defaultTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed17 = _defaultTextStyle.copyWith(
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed18 = _defaultTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed20 = _defaultTextStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed24 = _defaultTextStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed25 = _defaultTextStyle.copyWith(
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed28 = _defaultTextStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed32 = _defaultTextStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed36 = _defaultTextStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textMed48 = _defaultTextStyle.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get heading1 => GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.whitecolor,
  );
  static TextStyle get logotext => GoogleFonts.poppins(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: AppColors.primarycolor,
  );
  static TextStyle get bodytext => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.blackcolor,
  );
  static TextStyle get bodytext1 => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.blackcolor,
  );
  static TextStyle get litetext => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.blackcolor,
  );
  static TextStyle get litebuttontext => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.primarycolor,
  );
  static TextStyle get homeprimarytext => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primarycolor,
  );
  static TextStyle get earnprimary => GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.primarycolor,
    letterSpacing: 0,
  );
  static TextStyle get homesecoundarytext => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.blackcolor,
  );
  static TextStyle get inputLabel => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
  //  gilroyTextStyles

  static const _defaultTextStyle = TextStyle(
    color: AppColors.black,
    fontFamily: AppFontFamily.karla,
    fontWeight: FontWeight.w400,
  );
}
