import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/reusable_bestseller_list.dart';
import 'package:fourth_bookstoreui/models/book_model.dart';
import 'package:fourth_bookstoreui/providers/home_screen_provider.dart';
import 'package:fourth_bookstoreui/views/book_detail.dart';
import 'package:provider/provider.dart';

class BestSellerBooks extends StatefulWidget {
  const BestSellerBooks({Key? key}) : super(key: key);

  @override
  _BestSellerBooksState createState() => _BestSellerBooksState();
}

class _BestSellerBooksState extends State<BestSellerBooks> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                "Best Sellers",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                "View all",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Consumer<HomeScreenProvider>(builder: (context, data, child) {
          final List<BookModel> bookList = data.bestSellerBookList;
          return SizedBox(
            height: 230,
            child: ListView.builder(
              itemCount: bookList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ReusableBestSellerList(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookDetail(
                                  bookModel: bookList[index],
                                )));
                  },
                  rating: bookList[index].rating,
                  bookName: bookList[index].bookName,
                  cost: "Rs. ${bookList[index].price}",
                  path: bookList[index].image,
                  favorite: bookList[index].isFavorite,
                  favoriteOnTap: () {
                    Provider.of<HomeScreenProvider>(context, listen: false)
                        .changeFavoriteStatus(bookModel: bookList[index]);
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
