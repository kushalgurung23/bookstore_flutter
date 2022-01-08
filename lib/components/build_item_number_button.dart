import 'package:flutter/material.dart';

class BuildItemNumberButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPress;

  const BuildItemNumberButton(
      {Key? key, required this.iconData, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27,
      width: 26,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF000000)),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        onPressed: onPress,
        child: Icon(
          iconData,
          color: const Color(0xFF000000),
        ),
      ),
    );
  }
}
