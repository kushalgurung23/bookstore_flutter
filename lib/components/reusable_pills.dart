import 'package:flutter/material.dart';
class ReusablePills extends StatelessWidget {
  final String? title;
  final Icon? icon;

  const ReusablePills({Key? key, required this.icon, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      //margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      height: 38,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: const Color(0xFFDCDCDC),
        ),
        //color: Colors.teal,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Row(
        children: <Widget>[
          icon!,
          const SizedBox(width: 8),
          Text(title!),
        ],
      ),
    );
  }
}