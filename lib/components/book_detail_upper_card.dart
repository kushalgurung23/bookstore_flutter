import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/build_item_number_button.dart';
import 'package:fourth_bookstoreui/components/constants.dart';
import 'package:fourth_bookstoreui/components/size_configuration.dart';
import 'package:fourth_bookstoreui/models/book_model.dart';
import 'package:fourth_bookstoreui/providers/book_detail_screen_provider.dart';
import 'package:provider/provider.dart';

class BookDetailUpperCard extends StatefulWidget {
  final BookModel? bookModel;

  const BookDetailUpperCard({Key? key, required this.bookModel})
      : super(key: key);

  @override
  _BookDetailUpperCardState createState() => _BookDetailUpperCardState();
}

class _BookDetailUpperCardState extends State<BookDetailUpperCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: SizeConfig.defaultSize * 24,
          margin: const EdgeInsets.only(top: 45, bottom: 20),
          decoration: const BoxDecoration(
            color: Color(0x6FC4C4C4),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Stack(
            children: [
              Positioned(
                top: SizeConfig.defaultSize * 1.3,
                left: SizeConfig.defaultSize * 19,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ISBN: ${widget.bookModel!.isbnNumber}',
                        style: TextStyle(
                            fontSize: SizeConfig.defaultSize * 1.4,
                            color: const Color(0xFF909195),
                            fontFamily: 'MontserratMedium',
                            letterSpacing: 0.5)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.defaultSize * 1.5),
                      child: Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: kBigRating,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(widget.bookModel!.rating.toString(),
                                style: TextStyle(
                                    fontSize: SizeConfig.defaultSize * 1.5,
                                    color: const Color(0xFF000000),
                                    fontFamily: 'MontserratMedium',
                                    letterSpacing: 1)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: SizeConfig.defaultSize * 2.4,
                      width:
                          widget.bookModel!.stockStatus == 'In Stock' ? SizeConfig.defaultSize * 7 : SizeConfig.defaultSize * 10,
                      decoration: BoxDecoration(
                          color: widget.bookModel!.stockStatus == 'In Stock'
                              ? const Color(0xFF2FD114)
                              : Colors.red,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Center(
                        child: Text(widget.bookModel!.stockStatus,
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: SizeConfig.defaultSize * 1.3,
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
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: SizeConfig.defaultSize * 2,
                              color: Colors.black,
                              fontFamily: 'MontserratBold')),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text('See all details',
                          style: TextStyle(
                              fontSize: SizeConfig.defaultSize * 1.6,
                              color: const Color(0xFF909195),
                              fontFamily: 'MontserratMedium',
                              decoration: TextDecoration.underline)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.defaultSize * 3.5,
                          top: SizeConfig.defaultSize * 1.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BuildItemNumberButton(
                              iconData: Icons.remove,
                              onPress: () {
                                Provider.of<BookDetailScreenProvider>(context,
                                        listen: false)
                                    .decreaseBookNumber();
                              }),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.defaultSize * 2),
                            child: Consumer<BookDetailScreenProvider>(
                              builder: (context, data, child) {
                                return SizedBox(
                                  child: Text(
                                      data.selectedBookNumber
                                          .toString()
                                          .padLeft(2, "0"),
                                      style: TextStyle(
                                          fontSize: SizeConfig.defaultSize * 1.8,
                                          color: const Color(0xFF000000),
                                          fontFamily: 'MontserratMedium')),
                                );
                              },
                            ),
                          ),
                          BuildItemNumberButton(
                              iconData: Icons.add,
                              onPress: () {
                                Provider.of<BookDetailScreenProvider>(context,
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
        ),
        Positioned(
          width: SizeConfig.defaultSize * 16,
          left: SizeConfig.defaultSize * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: SizeConfig.defaultSize * 20,
                width: SizeConfig.defaultSize * 13,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: AssetImage(widget.bookModel!.image),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(widget.bookModel!.bookName,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.defaultSize * 1.7,
                        color: Colors.black,
                        fontFamily: 'MontserratMedium')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text('by ${widget.bookModel!.bookAuthor}',
                    style: TextStyle(
                        fontSize: SizeConfig.defaultSize * 1.4,
                        color: const Color(0xFF909195),
                        fontFamily: 'MontserratMedium',
                        letterSpacing: 0.5)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
