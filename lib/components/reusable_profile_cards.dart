import 'package:flutter/material.dart';

class ReusableProfileCards extends StatelessWidget {
  final String? authorName;
  final Color? color;
  final String? path;

  const ReusableProfileCards(
      {Key? key,
      required this.authorName,
      required this.color,
      required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(path!),
                fit: BoxFit.fill,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              color: color!,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            authorName!,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
