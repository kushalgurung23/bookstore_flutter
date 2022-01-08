import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fourth_bookstoreui/components/build_item_number_button.dart';
import 'package:fourth_bookstoreui/components/constants.dart';
import 'package:fourth_bookstoreui/components/custom_app_bar.dart';
import 'package:fourth_bookstoreui/components/size_configuration.dart';
import 'package:fourth_bookstoreui/models/book_model.dart';
import 'package:fourth_bookstoreui/providers/book_detail_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class BookDetail extends StatefulWidget {
  static const String id = '/book_detail';
  final String bookDescription =
      'A riveting, deeply personal account of history in the making-from the president who inspired us to believe in the power of democracyA riveting, deeply personal account of history in the making-from the president who inspired us to believe in the power of democracy';
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
          child: CustomAppBar(
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
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_outline,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: SizeConfig.defaultSize * 23,
                      margin: const EdgeInsets.only(top: 45, bottom: 20),
                      decoration: const BoxDecoration(
                        color: Color(0x6FC4C4C4),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    Positioned(
                      left: SizeConfig.defaultSize * 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: SizeConfig.defaultSize * 20,
                            width: SizeConfig.defaultSize * 13,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                image: DecorationImage(
                                    image: AssetImage(widget.bookModel!.image),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(widget.bookModel!.bookName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontFamily: 'MontserratMedium')),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text('by ${widget.bookModel!.bookAuthor}',
                                style: const TextStyle(
                                    fontSize: 13.0,
                                    color: Color(0xFF909195),
                                    fontFamily: 'MontserratMedium',
                                    letterSpacing: 0.5)),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: SizeConfig.defaultSize * 6,
                      left: SizeConfig.defaultSize * 19,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ISBN: ${widget.bookModel!.isbnNumber}',
                              style: const TextStyle(
                                  fontSize: 13.5,
                                  color: Color(0xFF909195),
                                  fontFamily: 'MontserratMedium',
                                  letterSpacing: 1)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.defaultSize * 1.5),
                            child: Row(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: kBigRating,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                      widget.bookModel!.rating.toString(),
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0xFF000000),
                                          fontFamily: 'MontserratMedium',
                                          letterSpacing: 1)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 23,
                            width: widget.bookModel!.stockStatus == 'In Stock'
                                ? 69
                                : 90,
                            decoration: BoxDecoration(
                                color:
                                    widget.bookModel!.stockStatus == 'In Stock'
                                        ? const Color(0xFF2FD114)
                                        : Colors.red,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: Center(
                              child: Text(widget.bookModel!.stockStatus,
                                  style: const TextStyle(
                                      letterSpacing: 0.5,
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontFamily: 'MontserratMedium')),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: SizeConfig.defaultSize * 1.5,
                                bottom: SizeConfig.defaultSize * 1.2),
                            child: Text(
                                'Rs. ${widget.bookModel!.offerPrice == 0 ? widget.bookModel!.price : widget.bookModel!.offerPrice}',
                                style: const TextStyle(
                                    letterSpacing: 0.5,
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontFamily: 'MontserratBold')),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text('See all details',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFF909195),
                                    fontFamily: 'MontserratMedium',
                                    decoration: TextDecoration.underline)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.defaultSize * 5.6,
                                top: SizeConfig.defaultSize * 1.2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                BuildItemNumberButton(
                                    iconData: Icons.remove,
                                    onPress: () {
                                      Provider.of<BookDetailScreenProvider>(
                                              context,
                                              listen: false)
                                          .decreaseBookNumber();
                                    }),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: SizeConfig.defaultSize * 2),
                                  child: Consumer<BookDetailScreenProvider>(
                                    builder: (context, data, child) {
                                      return Text('${data.selectedBookNumber}',
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Color(0xFF000000),
                                              fontFamily: 'MontserratMedium'));
                                    },
                                  ),
                                ),
                                BuildItemNumberButton(
                                    iconData: Icons.add,
                                    onPress: () {
                                      Provider.of<BookDetailScreenProvider>(
                                              context,
                                              listen: false)
                                          .increaseBookNumber();
                                    })
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                ReadMoreText(
                  widget.bookModel!.bookDescription,
                  trimLines: 3,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show More',
                  trimExpandedText: 'Show Less',
                  moreStyle: const TextStyle(
                      letterSpacing: 0.5,
                      backgroundColor: Color(0xFFC4C4C4),
                      color: Color(0xFFFFFFFF),
                      fontSize: 14,
                      fontFamily: 'MontserratMedium',
                      fontWeight: FontWeight.bold),
                  lessStyle: const TextStyle(
                      backgroundColor: Color(0xFFC4C4C4),
                      color: Color(0xFFFFFFFF),
                      fontSize: 14,
                      fontFamily: 'MontserratMedium',
                      fontWeight: FontWeight.bold),
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'MontserratMedium',
                      height: 1.5),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: SizeConfig.defaultSize * 1.2),
                            child: SizedBox(
                              height: SizeConfig.defaultSize * 3.5,
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Color(0xFFDCDCDC)),
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0,
                                      top: 5.0,
                                      right: 10.0,
                                      bottom: 4.0),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Reviews',
                        style: TextStyle(
                          fontFamily: 'MontserratMedium',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF525252),
                        )),
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
                                setState(() {
                                  data.dropDownValue = newValue.toString();
                                });
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
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
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
                                      const CircleAvatar(
                                        backgroundImage:
                                            AssetImage('Images/profile1.png'),
                                      ),
                                      Positioned(
                                          right: 0,
                                          bottom: 0,
                                          child: SvgPicture.asset(
                                              'Images/Award.svg'))
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Garth Stein',
                                        style: TextStyle(
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
                                          const Text(
                                            '4.3',
                                            style: TextStyle(
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
                              widget.bookDescription,
                              trimLines: 4,
                              textAlign: TextAlign.justify,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show More',
                              trimExpandedText: 'Show Less',
                              moreStyle: const TextStyle(
                                  letterSpacing: 0.5,
                                  backgroundColor: Color(0xFFC4C4C4),
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 12,
                                  fontFamily: 'MontserratMedium',
                                  fontWeight: FontWeight.bold),
                              lessStyle: const TextStyle(
                                  backgroundColor: Color(0xFFC4C4C4),
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 12,
                                  fontFamily: 'MontserratMedium',
                                  fontWeight: FontWeight.bold),
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'MontserratMedium',
                                  height: 1.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: Text('November 18, 2020',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'MontserratMedium',
                                    height: 1.5,
                                    color: Color(0xFF909195))),
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
