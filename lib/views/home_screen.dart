import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/floating_action_button.dart';
import 'package:fourth_bookstoreui/components/home_bottom_app_bar.dart';
import 'package:fourth_bookstoreui/components/home_screen_body.dart';
import 'package:fourth_bookstoreui/providers/book_detail_screen_provider.dart';
import 'package:fourth_bookstoreui/providers/home_screen_provider.dart';
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
    HomeScreenProvider homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProvider.getBookList();
    homeScreenProvider.getProfileCardList();
    Provider.of<BookDetailScreenProvider>(context, listen: false).loadReview();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingFavoriteButton(),
      bottomNavigationBar: HomeBottomAppBar(),
      body: HomeScreenBody()
    );
  }
}
