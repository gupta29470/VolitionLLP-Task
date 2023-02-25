import 'package:flutter/material.dart';
import 'package:volitionllp_task/common/navigation_helper.dart';
import 'package:volitionllp_task/common/route_helper.dart';
import 'package:volitionllp_task/styles/colors/app_color_helper.dart';
import 'package:volitionllp_task/styles/themes/text_theme_helper.dart';

import 'products/models/product_drop_down_list_screen_args.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volition LLP',
      onGenerateRoute: NavigationHelper.generateRoute,
      onGenerateInitialRoutes: (String initialRouteName) {
        return [
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
        ];
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColorHelper.glitterLake,
            minWidth: double.infinity,
            padding: const EdgeInsets.all(24),
            onPressed: () {
              navigateToQRCodeScanScreen(context);
            },
            child: Text(
              "Quick Scan",
              style: TextThemeHelper.white_14_700,
            ),
          ),
        ),
      ),
    );
  }
}

extension on HomeScreen {
  void navigateToQRCodeScanScreen(BuildContext context) {
    NavigationHelper.navigateToRoute(
      context,
      RouteHelper.qrCodeScanScr,
      null,
    );
  }
}
