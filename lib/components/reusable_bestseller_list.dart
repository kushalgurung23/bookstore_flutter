import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/constants.dart';

class ReusableBestSellerList extends StatefulWidget {
  final String? bookName;
  final String? cost;
  final String? path;
  final VoidCallback onTap;
  final bool favorite;
  final double rating;
  const ReusableBestSellerList(
      {Key? key,
      required this.bookName,
      required this.cost,
      required this.path,
      required this.onTap,
      required this.favorite,
      required this.rating})
      : super(key: key);

  @override
  State<ReusableBestSellerList> createState() => _ReusableBestSellerListState();
}

class _ReusableBestSellerListState extends State<ReusableBestSellerList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 4.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 90),
            width: 112,
            height: 70,
            decoration: const BoxDecoration(
              color: Color(0xFF5289B0),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          Positioned(
            right: 18.0,
            bottom: 90.0,
            child: Container(
              width: 77,
              height: 117,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.path!),
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: GestureDetector(
                onTap: widget.onTap,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4, right: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.favorite == false
                          ? const Icon(
                              Icons.bookmark_outline,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.bookmark,
                              color: Colors.orangeAccent,
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 47,
            child: Text(
              widget.bookName!,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          Positioned(
            bottom: 25,
            child: Row(
              children: <Widget>[
                Row(
                  children: kRating,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.rating.toString(),
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            child: Text(
              widget.cost!,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
