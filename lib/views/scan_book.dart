import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/scan_book_body.dart';
import 'package:fourth_bookstoreui/components/size_configuration.dart';
import 'package:fourth_bookstoreui/providers/scan_book_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanBook extends StatefulWidget {
  static const String id = '/scan_book';

  const ScanBook({Key? key}) : super(key: key);

  @override
  State<ScanBook> createState() => _ScanBookState();
}

class _ScanBookState extends State<ScanBook> {
  // To avoid camera off while hot reloading.
  @override
  void reassemble() async {
    super.reassemble();
    QRViewController? controller =
        Provider.of<ScanBookProvider>(context, listen: false).controller;
    if (Platform.isAndroid) {
      await controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      body: ScanBookBody(),
    );
  }

  @override
  void dispose() {
    Provider.of<ScanBookProvider>(context, listen: false).controller?.dispose();
    super.dispose();
  }
}
