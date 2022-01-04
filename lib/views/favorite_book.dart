import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/constants.dart';
import 'package:fourth_bookstoreui/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class FavoriteBook extends StatefulWidget {
  static const String id = '/favorite_book';

  const FavoriteBook({Key? key}) : super(key: key);

  @override
  _FavoriteBookState createState() => _FavoriteBookState();
}

class _FavoriteBookState extends State<FavoriteBook> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeScreenProvider>(context, listen: false).addFavoriteBooks();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFFFFFFF),
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Favorite Books',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Consumer<HomeScreenProvider>(
          builder: (context, data, child) {
            return data.favoriteBookList.isNotEmpty
                ? ListView.builder(
                    itemCount: data.favoriteBookList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 15, right: 15),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: [0.7, 0.1],
                                    colors: [Colors.blue, Color(0xFFDACAFB)]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        data.favoriteBookList[index].image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                height: 110,
                                width: 70,
                              ),
                            ),
                            Positioned(
                              top: 30,
                              left: 100,
                              child: Text(
                                  data.favoriteBookList[index].bookDescription, style: const TextStyle(color: Colors.white)),
                            ),
                            Positioned(
                              top: 30,
                              right: 30,
                              child: Text("Rs. " +
                                  data.favoriteBookList[index].price.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
                            ),
                            Positioned(
                              left: 100,
                              bottom: 25,
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: kRating,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    data.favoriteBookList[index].rating.toString(),
                                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                : const Center(
                    child: Text('You don\'t have any favorite books.'),
                  );
          },
        ),
        backgroundColor: const Color(0xFFFFFFFF),
      ),
    );
  }
}
