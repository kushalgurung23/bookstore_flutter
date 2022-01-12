import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/custom_app_bar.dart';
import 'package:fourth_bookstoreui/models/book_model.dart';
import 'package:fourth_bookstoreui/providers/book_detail_screen_provider.dart';
import 'package:fourth_bookstoreui/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class BookDetailAppBar extends StatefulWidget {
  final BookModel? bookModel;

  const BookDetailAppBar({Key? key, required this.bookModel}) : super(key: key);

  @override
  _BookDetailAppBarState createState() => _BookDetailAppBarState();
}

class _BookDetailAppBarState extends State<BookDetailAppBar> {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      text: '',
      textStyle: const TextStyle(color: Colors.black),
      icon: const Icon(
        CupertinoIcons.back,
        color: Colors.black,
      ),
      onPress: () {
        Provider.of<BookDetailScreenProvider>(context, listen: false)
            .navigateBack(context);
      },
      color: const Color(0x00FFFFFF),
      listOfWidget: [
        Consumer<HomeScreenProvider>(
          builder: (context, data, child) {
            return IconButton(
              onPressed: () {
                Provider.of<HomeScreenProvider>(context, listen: false)
                    .changeFavoriteStatus(bookModel: widget.bookModel!);
              },
              icon: widget.bookModel!.isFavorite == false
                  ? const Icon(
                      Icons.bookmark_outline,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.bookmark,
                      color: Colors.orangeAccent,
                    ),
            );
          },
        )
      ],
    );
  }
}
