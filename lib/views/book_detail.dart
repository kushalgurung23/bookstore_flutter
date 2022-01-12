import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/book_detail_app_bar.dart';
import 'package:fourth_bookstoreui/components/book_detail_body.dart';
import 'package:fourth_bookstoreui/components/size_configuration.dart';
import 'package:fourth_bookstoreui/models/book_model.dart';

class BookDetail extends StatefulWidget {
  static const String id = '/book_detail';
  final BookModel? bookModel;
  const BookDetail({Key? key, this.bookModel}) : super(key: key);

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: BookDetailAppBar(bookModel: widget.bookModel!),
        ),
        body: BookDetailBody(
          bookModel: widget.bookModel!,
        ),
      ),
    );
  }
}
