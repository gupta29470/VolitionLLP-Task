import 'package:flutter/material.dart';
import 'package:volitionllp_task/common/route_helper.dart';
import 'package:volitionllp_task/main.dart';
import 'package:volitionllp_task/products/models/product_detail_screen_args.dart';
import 'package:volitionllp_task/products/models/product_drop_down_list_screen_args.dart';
import 'package:volitionllp_task/products/screens/product_detail_screen.dart';
import 'package:volitionllp_task/products/screens/products_drop_down_list_screen.dart';
import 'package:volitionllp_task/qr_code_scan/screens/qr_code_scan_screen.dart';

class NavigationHelper {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteHelper.productsDropDownListScr:
        return getPageTransitionRoute(
          settings,
          ProductsDropDownListScreen(
            args: settings.arguments as ProductDropDownListScreenArgs,
          ),
        );

      case RouteHelper.qrCodeScanScr:
        return getPageTransitionRoute(
          settings,
          const QRCodeScanScreen(),
        );

      case RouteHelper.productDetailScr:
        return getPageTransitionRoute(
          settings,
          ProductDetailScreen(
            args: settings.arguments as ProductDetailScreenArgs,
          ),
        );

      default:
        return getPageTransitionRoute(
          settings,
          const HomeScreen(),
        );
    }
  }

  static Future<T?> navigateToRoute<T>(
    BuildContext context,
    String routeName,
    dynamic args,
  ) {
    return Navigator.pushNamed(
      context,
      routeName,
      arguments: args,
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static MaterialPageRoute getPageTransitionRoute(
    RouteSettings settings,
    Widget widget,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => widget,
    );
  }
}
