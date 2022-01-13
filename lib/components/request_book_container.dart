import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/size_configuration.dart';

class RequestBookContainer extends StatelessWidget {
  const RequestBookContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
          height: SizeConfig.defaultSize * 13,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color(0xFFFF7F50),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Stack(
            children: [
              Positioned(
                  right: SizeConfig.defaultSize * 9.5,
                  top: SizeConfig.defaultSize * 3.5,
                  child: const Text(
                    "Didn’t find the book?",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  )),
              Positioned(
                  right: SizeConfig.defaultSize * 5,
                  top: SizeConfig.defaultSize * 6.5,
                  child: const Text(
                    "Request us and we will get back to you.",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  )),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
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
      ],
    );
  }
}
