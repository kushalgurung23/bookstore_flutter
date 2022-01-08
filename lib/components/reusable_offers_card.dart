import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/constants.dart';

class ReusableOffersCard extends StatefulWidget {
  final String? bookName;
  final String? cost;
  final String? offerCost;
  final String? path;
  final double rating;
  final VoidCallback onTap, favoriteOnTap;
  final bool isFavorite;

  const ReusableOffersCard(
      {Key? key,
      required this.onTap,
      required this.bookName,
      required this.cost,
      required this.offerCost,
      required this.path,
      required this.rating,
      required this.favoriteOnTap,
      required this.isFavorite})
      : super(key: key);

  @override
  State<ReusableOffersCard> createState() => _ReusableOffersCardState();
}

class _ReusableOffersCardState extends State<ReusableOffersCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 85,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.path!),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        widget.bookName!,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: kRating,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 5),
                      Text(
                        widget.cost!,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.offerCost!,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: widget.favoriteOnTap,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      widget.isFavorite == false
                          ? const Icon(
                              Icons.bookmark_outline,
                              size: 18,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.bookmark,
                              size: 18,
                              color: Colors.orangeAccent,
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.rating}",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
