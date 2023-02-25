import 'package:flutter/material.dart';
import 'package:volitionllp_task/styles/colors/app_color_helper.dart';
import 'package:volitionllp_task/styles/themes/decoration_helper.dart';
import 'package:volitionllp_task/styles/themes/text_theme_helper.dart';

class QRCodeScanModalBottomWidget extends StatelessWidget {
  const QRCodeScanModalBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: DecorationHelper.qrScreenBottomSheetDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "Loading your data",
              style: TextThemeHelper.glitterLake_14_700,
            ),
          ),
          const CircularProgressIndicator(
            color: AppColorHelper.glitterLake,
          ),
        ],
      ),
    );
  }
}
