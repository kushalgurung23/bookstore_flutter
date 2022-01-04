import 'package:flutter/material.dart';

class RequestBookContainer extends StatelessWidget {
  const RequestBookContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin:
          const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
          height: 120,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color(0xFFFF7F50),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        Positioned(
          bottom: 60,
          right: 260,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Images/Saly.png'),
                fit: BoxFit.fill,
              ),
            ),
            height: 120,
            width: 140,
          ),
        ),
        const Positioned(
            right: 110,
            bottom: 90,
            child: Text(
              "Didn’t find the book?",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            )),
        const Positioned(
            right: 60,
            bottom: 70,
            child: Text(
              "Request us and we will get back to you.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            )),
      ],
    );
  }
}
