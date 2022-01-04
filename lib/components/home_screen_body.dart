import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/best_seller_books.dart';
import 'package:fourth_bookstoreui/components/gift_point_container.dart';
import 'package:fourth_bookstoreui/components/offer_books.dart';
import 'package:fourth_bookstoreui/components/popular_authors.dart';
import 'package:fourth_bookstoreui/components/request_book_container.dart';
import 'package:fourth_bookstoreui/components/reusable_pills.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          const GiftPointContainer(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const <Widget>[
                ReusablePills(icon: Icon(Icons.face), title: "Horror"),
                ReusablePills(icon: Icon(Icons.face), title: "Motivational"),
                ReusablePills(icon: Icon(Icons.face), title: "Fiction"),
                ReusablePills(icon: Icon(Icons.face), title: "Comedy"),
                ReusablePills(icon: Icon(Icons.face), title: "Rom-Com"),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const BestSellerBooks(),
          const OfferBooks(),
          const PopularAuthors(),
          const RequestBookContainer(),
        ],
      ),
    );
  }
}
