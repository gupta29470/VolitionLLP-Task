part of '../screens/qr_code_scan_screen.dart';

extension on _QRCodeScanScreenState {
  void showLoadingBottomSheetAndNavigate(
    BarcodeCapture capture,
    BuildContext context,
  ) {
    String link = "";

    if (capture.barcodes.isNotEmpty) {
      link = capture.barcodes[0].rawValue ?? "";
    }

    showModalBottomSheet(
        context: context,
        builder: (bottomContext) {
          Future.delayed(
            const Duration(seconds: 2),
            () {
              Navigator.pop(bottomContext);
              NavigationHelper.navigateToRoute(
                context,
                RouteHelper.productsDropDownListScr,
                ProductDropDownListScreenArgs(
                  link: link,
                ),
              );
            },
          );
          return const QRCodeScanModalBottomWidget();
        });
  }
}
