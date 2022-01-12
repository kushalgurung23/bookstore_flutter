import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fourth_bookstoreui/components/constants.dart';
import 'package:fourth_bookstoreui/models/review_model.dart';
import 'package:fourth_bookstoreui/providers/book_detail_screen_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class BookDetailReviews extends StatefulWidget {
  const BookDetailReviews({Key? key}) : super(key: key);

  @override
  _BookDetailReviewsState createState() => _BookDetailReviewsState();
}

class _BookDetailReviewsState extends State<BookDetailReviews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Reviews',
              style: TextStyle(
                fontFamily: 'MontserratMedium',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF525252),
              ),
            ),
            Consumer<BookDetailScreenProvider>(
              builder: (context, data, child) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                        color: const Color(0xFFBBBBBB),
                        style: BorderStyle.solid,
                        width: 1),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      // Initial Value
                      value: data.dropDownValue,
                      // Down Arrow Icon
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF000000),
                      ),
                      style: const TextStyle(
                        fontFamily: 'MontserratMedium',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF000000),
                      ),
                      // Array list of items
                      items: data.items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(
                              fontFamily: 'MontserratMedium',
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF000000),
                            ),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (newValue) {
                        data.changeDropDownValue(newValue.toString());
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Consumer<BookDetailScreenProvider>(
          builder: (context, data, child) {
            List<ReviewModel> reviewList = data.review;
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reviewList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage(reviewList[index].userImage),
                                  ),
                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child:
                                          SvgPicture.asset('Images/Award.svg'))
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    reviewList[index].fullName,
                                    style: const TextStyle(
                                      fontFamily: 'MontserratMedium',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: kRating,
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        reviewList[index].rating.toString(),
                                        style: const TextStyle(
                                          fontFamily: 'MontserratMedium',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF000000),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: SvgPicture.asset('Images/More.svg'),
                            onTap: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: ReadMoreText(
                          reviewList[index].review,
                          trimLines: 4,
                          textAlign: TextAlign.justify,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show More',
                          trimExpandedText: 'Show Less',
                          moreStyle: kReviewReadMoreTextStyle,
                          lessStyle: kReviewReadMoreTextStyle,
                          style: kReviewTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                            DateFormat("dd MMMM yyyy")
                                .format(reviewList[index].date),
                            style: const TextStyle(
                                fontSize: 13,
                                fontFamily: 'MontserratMedium',
                                height: 1.5,
                                color: Color(0xFF909195))),
                      ),
                    ],
                  );
                });
          },
        ),
      ],
    );
  }
}
