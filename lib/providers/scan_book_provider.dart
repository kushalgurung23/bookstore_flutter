import 'package:flutter/cupertino.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanBookProvider extends ChangeNotifier {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  Barcode? barcode;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    // Listening to scanned data to receive barcode.
    controller.scannedDataStream.listen((scanData) {
      barcode = scanData;
      notifyListeners();
    });
    notifyListeners();
  }

  Future openBrowserUrl({required String url, bool inApp = false}) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: inApp, // ios
        forceWebView: inApp, // android
        enableJavaScript: true, // an
      );
    }
  }

  void navigateBackFromScan(BuildContext context) {
    Navigator.pop(context);
  }

  void toggleLight() async {
    await controller!.toggleFlash();
    notifyListeners();
  }
}
