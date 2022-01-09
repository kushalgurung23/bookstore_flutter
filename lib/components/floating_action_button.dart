import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class FloatingFavoriteButton extends StatelessWidget {
  const FloatingFavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: FloatingActionButton(
        child: Container(
          height: 75,
          width: 75,
          child: const Icon(
            Icons.qr_code,
            size: 45,
          ),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.01, 0.6],
                  colors: [Color(0xffffffff), Color(0xffff7f50)])),
        ),
        onPressed: () {
          Provider.of<HomeScreenProvider>(context, listen: false).navigateToQRScanScreen(context);
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
