import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/size_configuration.dart';

class GiftPointContainer extends StatelessWidget {
  const GiftPointContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
              left: 15, right: 15, bottom: 15, top: 70),
          height: SizeConfig.defaultSize * 12.5,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFDACAFB),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                width: SizeConfig.defaultSize * 25.5,
                top: SizeConfig.defaultSize * 2,
                left: SizeConfig.defaultSize * 2.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Refer and win 50 Points! Grab the offer now!!",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize /2,
                    ),
                    const Text(
                      "Lorem ipsum lorem. Lorem \nipsum lorem dkdoa",
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 35,
          right: 0,
          child: Container(
            height: SizeConfig.defaultSize * 13,
            width: SizeConfig.defaultSize * 13,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Images/gift_front.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
