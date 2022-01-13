import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/size_configuration.dart';
import 'package:fourth_bookstoreui/providers/scan_book_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanBookBody extends StatefulWidget {
  const ScanBookBody({Key? key}) : super(key: key);

  @override
  _ScanBookBodyState createState() => _ScanBookBodyState();
}

class _ScanBookBodyState extends State<ScanBookBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScanBookProvider>(
      builder: (context, data, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            QRView(
              key: data.qrKey,
              onQRViewCreated: data.onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  cutOutSize:
                      MediaQuery.of(context).size.width * 0.9, // 90 percent,
                  borderWidth: 5,
                  borderLength: 80,
                  borderRadius: 70,
                  borderColor: const Color(0xFFFFFFFF)),
            ),
            Positioned(
              bottom: SizeConfig.defaultSize * 3,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.all(SizeConfig.defaultSize),
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: GestureDetector(
                  onTap: () async {
                    const String? url =
                        "https://www.youtube.com/watch?v=isRaafOdGbE&list=RDcfyCAwPugOQ&index=13";

                    //final String? url = data.barcode?.code.toString();
                    data.openBrowserUrl(url: url, inApp: true, context: context);
                  },
                  child: Text(
                    data.barcode == null
                        ? 'Scan the code'
                        : 'Result: ${data.barcode?.code}',
                    maxLines: 4,
                    style: const TextStyle(
                        color: Colors.yellow, overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: SizeConfig.defaultSize * 3.5,
              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.defaultSize),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black54,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Provider.of<ScanBookProvider>(context, listen: false)
                          .navigateBackFromScan(context);
                    },
                    icon: const Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: SizeConfig.defaultSize * 3.5,
              child: Padding(
                padding: EdgeInsets.only(right: SizeConfig.defaultSize),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black54,
                  ),
                  child: IconButton(
                    onPressed: () {
                      data.toggleLight(context);
                    },
                    icon: FutureBuilder<bool?>(
                      future: data.controller?.getFlashStatus(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Icon(
                            snapshot.data == true ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
