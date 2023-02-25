import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:volitionllp_task/common/navigation_helper.dart';
import 'package:volitionllp_task/common/route_helper.dart';
import 'package:volitionllp_task/products/models/product_drop_down_list_screen_args.dart';
import 'package:volitionllp_task/qr_code_scan/widgets/qr_code_scan_modal_bottom_widget.dart';

part '../extensions/qr_code_scan_screen_ext.dart';

class QRCodeScanScreen extends StatefulWidget {
  static const String tag = "QRCodeScanScreen";
  const QRCodeScanScreen({super.key});

  @override
  State<QRCodeScanScreen> createState() => _QRCodeScanScreenState();
}

class _QRCodeScanScreenState extends State<QRCodeScanScreen> {
  ValueNotifier<bool> detected = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        controller: MobileScannerController(
          facing: CameraFacing.back,
        ),
        onDetect: (capture) {
          if (!detected.value) {
            showLoadingBottomSheetAndNavigate(
              capture,
              context,
            );
          }
          detected.value = true;
        },
      ),
    );
  }
}
