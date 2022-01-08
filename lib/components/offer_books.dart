import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/reusable_offers_card.dart';
import 'package:fourth_bookstoreui/models/book_model.dart';
import 'package:fourth_bookstoreui/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class OfferBooks extends StatefulWidget {
  const OfferBooks({Key? key}) : super(key: key);

  @override
  _OfferBooksState createState() => _OfferBooksState();
}

class _OfferBooksState extends State<OfferBooks> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, bottom: 10, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Text(
                    "Grab These Offers",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.orange,
                  )
                ],
              ),
              const Text(
                "View all",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Consumer<HomeScreenProvider>(builder: (context, data, child) {
          final List<BookModel> offerCardList = data.grabTheseOfferBookList;
          return SizedBox(
            height: 80,
            child: ListView.builder(
              itemCount: offerCardList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ReusableOffersCard(
                  onTap: () {
                    Provider.of<HomeScreenProvider>(context, listen: false)
                        .navigateToBookDetailScreen(
                            context, offerCardList[index]);
                  },
                  bookName: offerCardList[index].bookName,
                  cost: "Rs. ${offerCardList[index].price}",
                  offerCost: offerCardList[index].offerPrice.toString(),
                  path: offerCardList[index].image,
                  isFavorite: offerCardList[index].isFavorite,
                  rating: offerCardList[index].rating,
                  favoriteOnTap: () {
                    Provider.of<HomeScreenProvider>(context, listen: false)
                        .changeFavoriteStatus(bookModel: offerCardList[index]);
                  },
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
