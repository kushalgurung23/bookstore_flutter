import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/reusable_bestseller_list.dart';
import 'package:fourth_bookstoreui/components/reusable_offers_card.dart';
import 'package:fourth_bookstoreui/components/reusable_pills.dart';
import 'package:fourth_bookstoreui/components/reusable_profile_cards.dart';
import 'package:fourth_bookstoreui/models/book_model.dart';
import 'package:fourth_bookstoreui/models/profile_card_model.dart';
import 'package:fourth_bookstoreui/providers/home_screen_provider.dart';
import 'package:fourth_bookstoreui/views/favorite_book.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String id = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeScreenProvider homeScreenProvider = Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProvider.getBookList();
    homeScreenProvider.getProfileCardList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          child: Container(
            height: 75,
            width: 75,
            child: const Icon(
              Icons.favorite,
              size: 45,
            ),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.01, 0.6],
                    colors: [Color(0xffffffff), Color(0xffff7f50)])),
          ),
          onPressed: () {
            Navigator.pushNamed(context, FavoriteBook.id);
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 6,
                blurRadius: 8,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          height: 70,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.home_outlined,
                            color: Colors.black87),
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search_rounded,
                            color: Colors.black87),
                        iconSize: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_sharp,
                          color: Colors.black87,
                        ),
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.person_outline,
                            color: Colors.black87),
                        iconSize: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 15, top: 70),
                  height: 105,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDACAFB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 35,
                  right: 240,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35),
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
                  right: 35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Refer and win 50 Points!",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Lorem ipsum lorem dkdoa. Lorem \nipsum lorem dkdoa",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  //const SizedBox(width: 20),
                  Text(
                    "Best Sellers",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  // const SizedBox(width: 20),
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
                      rating: bookList[index].rating,
                      bookName: bookList[index].bookDescription,
                      cost: "Rs. ${bookList[index].price}",
                      path: bookList[index].image,
                      favorite: bookList[index].isFavorite,
                      onTap: () {
                        Provider.of<HomeScreenProvider>(context, listen: false)
                            .changeFavoriteStatus(bookModel: bookList[index]);
                      },
                    );
                  },
                ),
              );
            }),
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
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
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
                  // const SizedBox(width: 20),
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
                      bookName: offerCardList[index].bookDescription,
                      cost: "Rs. ${offerCardList[index].price}",
                      offerCost: offerCardList[index].offerPrice.toString(),
                      path: offerCardList[index].image,
                      isFavorite: offerCardList[index].isFavorite,
                      rating: offerCardList[index].rating,
                      onTap: () {
                        Provider.of<HomeScreenProvider>(context, listen: false)
                            .changeFavoriteStatus(
                                bookModel: offerCardList[index]);
                      },
                    );
                  },
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Row(
                children: const <Widget>[
                  Text(
                    "Popular Authors",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Consumer<HomeScreenProvider>(builder: (context, data, child) {
              final List<ProfileCardModel> profileCardList =
                  data.profileCardList;
              return SizedBox(
                height: 110,
                child: ListView.builder(
                  itemCount: profileCardList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ReusableProfileCards(
                        authorName: profileCardList[index].authorName,
                        color: profileCardList[index].color,
                        path: profileCardList[index].image);
                  },
                ),
              );
            }),
            Stack(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF7F50),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                Positioned(
                  bottom: 90,
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
                    bottom: 120,
                    child: Text(
                      "Didn’t find the book?",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    )),
                const Positioned(
                    right: 60,
                    bottom: 100,
                    child: Text(
                      "Request us and we will get back to you.",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
