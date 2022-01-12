import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/constants.dart';
import 'package:fourth_bookstoreui/components/size_configuration.dart';
import 'package:fourth_bookstoreui/models/book_model.dart';
import 'package:readmore/readmore.dart';

class BookDetailDescription extends StatefulWidget {
  final BookModel? bookModel;

  const BookDetailDescription({Key? key, required this.bookModel})
      : super(key: key);

  @override
  _BookDetailDescriptionState createState() => _BookDetailDescriptionState();
}

class _BookDetailDescriptionState extends State<BookDetailDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReadMoreText(
          widget.bookModel!.bookDescription,
          trimLines: 3,
          textAlign: TextAlign.justify,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show More',
          trimExpandedText: 'Show Less',
          moreStyle: kDescriptionReadMoreTextStyle,
          lessStyle: kDescriptionReadMoreTextStyle,
          style: const TextStyle(
              fontSize: 14, fontFamily: 'MontserratMedium', height: 1.5),
        ),
        SizedBox(
          height: SizeConfig.defaultSize / 2,
        ),
        SizedBox(
          height: SizeConfig.defaultSize * 6.5,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.bookModel!.bookGenre.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: SizeConfig.defaultSize * 1.2),
                    child: SizedBox(
                      height: SizeConfig.defaultSize * 3.5,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFDCDCDC)),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 5.0, right: 10.0, bottom: 4.0),
                          child: Row(
                            children: [
                              Image.asset(
                                  '${widget.bookModel!.bookGenre[index]['GenreImage']}'),
                              const SizedBox(width: 3),
                              Text(
                                '${widget.bookModel!.bookGenre[index]['Genre']}',
                                style: const TextStyle(
                                    fontFamily: 'MontserratMedium',
                                    fontSize: 13,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: SizeConfig.defaultSize),
      ],
    );
  }
}
