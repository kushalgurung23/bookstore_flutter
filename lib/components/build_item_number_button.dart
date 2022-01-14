import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/size_configuration.dart';

class BuildItemNumberButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPress;

  const BuildItemNumberButton(
      {Key? key, required this.iconData, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize * 2.9,
      width: SizeConfig.defaultSize * 2.8,
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
          size: SizeConfig.defaultSize * 2,
        ),
      ),
    );
  }
}
