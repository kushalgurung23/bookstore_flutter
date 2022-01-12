import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/book_detail_description.dart';
import 'package:fourth_bookstoreui/components/book_detail_reviews.dart';
import 'package:fourth_bookstoreui/components/book_detail_upper_card.dart';
import 'package:fourth_bookstoreui/components/size_configuration.dart';
import 'package:fourth_bookstoreui/models/book_model.dart';

class BookDetailBody extends StatefulWidget {

  final BookModel? bookModel;

  const BookDetailBody({Key? key, required this.bookModel}) : super(key: key);

  @override
  State<BookDetailBody> createState() => _BookDetailBodyState();
}

class _BookDetailBodyState extends State<BookDetailBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookDetailUpperCard(bookModel: widget.bookModel!),
            BookDetailDescription(bookModel: widget.bookModel!),
            const BookDetailReviews()
          ],
        ),
      ),
    );
  }
}
