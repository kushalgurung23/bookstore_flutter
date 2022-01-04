import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Icon icon;
  final VoidCallback onPress;
  final Color color;

  const CustomAppBar(
      {Key? key,
      required this.text,
      required this.textStyle,
      required this.icon,
      required this.onPress,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: color,
      leading: IconButton(
        icon: icon,
        onPressed: onPress,
      ),
      title: Text(
        text,
        style: textStyle,
      ),
      centerTitle: true,
    );
  }
}
