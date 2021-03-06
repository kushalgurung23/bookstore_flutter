import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/providers/book_detail_screen_provider.dart';
import 'package:fourth_bookstoreui/providers/home_screen_provider.dart';
import 'package:fourth_bookstoreui/providers/scan_book_provider.dart';
import 'package:fourth_bookstoreui/views/book_detail.dart';
import 'package:fourth_bookstoreui/views/favorite_book.dart';
import 'package:fourth_bookstoreui/views/home_screen.dart';
import 'package:fourth_bookstoreui/views/scan_book.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
    ChangeNotifierProvider(create: (context) => BookDetailScreenProvider()),
    ChangeNotifierProvider(create: (context) => ScanBookProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        FavoriteBook.id: (context) => const FavoriteBook(),
        BookDetail.id: (context) => const BookDetail(),
        ScanBook.id: (context) => const ScanBook(),
      },
      initialRoute: HomePage.id,
    );
  }
}
