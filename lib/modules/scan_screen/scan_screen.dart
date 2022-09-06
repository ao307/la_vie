import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/modules/blog_screen/blog_screen.dart';
import 'package:la_vie/modules/product_scan_screen/scan_product_screen.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../shared/cubit/scan_cubit/scan_cubit.dart';
import '../../shared/cubit/scan_cubit/scan_states.dart';

// ignore: must_be_immutable
class ScanScreen extends StatelessWidget {
  ScanScreen({Key? key}) : super(key: key);
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    final ScanCubit scanCubit = ScanCubit.get(context);
    scanCubit.scanValue = "";
    return BlocConsumer<ScanCubit, ScanStates>(
      listener: (context, state) {
        if (state is GetScanProductSuccessState) {
          navigateTo(
              context: context,
              widget: ScanProductScreen(
                productData: scanCubit.productData,
              ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              MobileScanner(
                controller: MobileScannerController(
                  torchEnabled: false,
                ),
                onDetect: (barcode, args) {
                  if (barcode.rawValue == null) {
                    showToast(msg: 'failed to scan Barcode');
                  } else {
                    scanCubit.getScanData(barcode.rawValue!);
                  }
                },
              ),
              Container(
                color: Colors.black45,
              ),
              CustomPaint(
                painter: BorderPainter(),
                child: SizedBox(
                  width: screenW(context) * .7,
                  height: screenW(context) * .7,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = 4.0;
    const radius = 20.0;
    const tRadius = 4 * radius;
    final rect = Rect.fromLTWH(
      width,
      width,
      size.width - 2 * width,
      size.height - 2 * width,
    );
    final rRect = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(borderRadiusSmall + 2),
    );
    const clippingRectTopLeft = Rect.fromLTWH(
      0,
      0,
      tRadius,
      tRadius,
    );
    final clippingRectTopRight = Rect.fromLTWH(
      size.width - tRadius,
      0,
      tRadius,
      tRadius,
    );
    final clippingBottomLeft = Rect.fromLTWH(
      0,
      size.height - tRadius,
      tRadius,
      tRadius,
    );
    final clippingBottomRight = Rect.fromLTWH(
      size.width - tRadius,
      size.height - tRadius,
      tRadius,
      tRadius,
    );

    final path = Path()
      ..addRect(clippingRectTopLeft)
      ..addRect(clippingRectTopRight)
      ..addRect(clippingBottomLeft)
      ..addRect(clippingBottomRight);

    canvas.clipPath(path);
    canvas.drawRRect(
      rRect,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// ignore: avoid_classes_with_only_static_members
class BarReaderSize {
  static double width = 200;
  static double height = 200;
}
