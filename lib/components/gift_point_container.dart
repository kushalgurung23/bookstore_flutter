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
          height: 105,
          width: MediaQuery.of(context).size.width - 60,
          decoration: const BoxDecoration(
            color: Color(0xFFDACAFB),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
        Positioned(
          bottom: 35,
          right: 0,
          child: Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Images/gift_front.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          left: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                "Refer and win 50 Points!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Lorem ipsum lorem. \nipsum lorem dkdoa",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ],
    );
  }
}
