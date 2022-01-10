import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/size_configuration.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanBook extends StatefulWidget {
  static const String id = '/scan_book';

  const ScanBook({Key? key}) : super(key: key);

  @override
  State<ScanBook> createState() => _ScanBookState();
}

class _ScanBookState extends State<ScanBook> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? barcode;
  QRViewController? controller;
  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    // Listening to scanned data to receive barcode.
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
      });
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  // To avoid camera off while hot reloading.
  @override
  void reassemble() async {
    // TODO: implement reassemble
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: onQRViewCreated,
            overlay: QrScannerOverlayShape(
                cutOutSize:
                    MediaQuery.of(context).size.width * 0.9, // 90 percent,
                borderWidth: 5,
                borderLength: 80,
                borderRadius: 70,
                borderColor: const Color(0xFFFFFFFF)),
          ),
          Positioned(
            bottom: SizeConfig.defaultSize * 2,
            child: Container(
              padding: EdgeInsets.all(SizeConfig.defaultSize),
              decoration: const BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                barcode == null ? 'Scan the code' : 'Result: ${barcode!.code}',
                maxLines: 2,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.defaultSize * 3.5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      await controller?.toggleFlash();
                      setState(() {});
                    },
                    icon: FutureBuilder<bool?>(
                      future: controller!.getFlashStatus(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Icon(
                            snapshot.data! ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
