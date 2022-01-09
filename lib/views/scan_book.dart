import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanBook extends StatefulWidget {
  static const String id = '/scan_book';

  const ScanBook({Key? key}) : super(key: key);

  @override
  State<ScanBook> createState() => _ScanBookState();
}

class _ScanBookState extends State<ScanBook> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: onQRViewCreated,
            overlay: QrScannerOverlayShape(),
          ),
        ],
      ),
    );
  }
}
