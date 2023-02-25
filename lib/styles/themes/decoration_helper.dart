import 'package:flutter/material.dart';
import 'package:volitionllp_task/styles/colors/app_color_helper.dart';

class DecorationHelper {
  static const BoxDecoration qrScreenBottomSheetDecoration = BoxDecoration(
      color: AppColorHelper.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ));

  static BoxDecoration titleDropdownDecoration = BoxDecoration(
    color: AppColorHelper.glitterLake,
    borderRadius: BorderRadius.circular(12),
  );
}
