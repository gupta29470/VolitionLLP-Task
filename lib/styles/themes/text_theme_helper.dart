import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volitionllp_task/styles/colors/app_color_helper.dart';

class TextThemeHelper {
  static TextStyle white_12_400 = GoogleFonts.poppins(
    color: AppColorHelper.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle glitterLake_14_700 = white_12_400.copyWith(
    color: AppColorHelper.glitterLake,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle white_14_700 = white_12_400.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle quickSilver_16_400 = white_12_400.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColorHelper.quickSilver,
  );

  static TextStyle black_16_700 = white_12_400.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColorHelper.black,
  );

  static TextStyle quickSilver_12_500 = white_12_400.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColorHelper.quickSilver,
  );

  static TextStyle black_20_700 = white_12_400.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColorHelper.black,
  );

  static TextStyle glitterLake_20_700 = white_12_400.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColorHelper.glitterLake,
  );
}
