import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/custom_app_bar.dart';
import 'package:fourth_bookstoreui/components/favorite_book_body.dart';
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
    super.initState();
    Provider.of<HomeScreenProvider>(context, listen: false).addFavoriteBooks();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: CustomAppBar(
                text: 'Favorite Books',
                textStyle: const TextStyle(color: Colors.black),
                icon: const Icon(
                  CupertinoIcons.back,
                  color: Colors.black,
                ),
                onPress: () {
                  Navigator.pop(context);
                },
                color: const Color(0xFFFFFFFF))),
        backgroundColor: const Color(0xFFFFFFFF),
        body: const FavoriteBookBody(),
      ),
    );
  }
}
