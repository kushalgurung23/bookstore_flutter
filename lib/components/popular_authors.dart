import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/reusable_profile_cards.dart';
import 'package:fourth_bookstoreui/models/profile_card_model.dart';
import 'package:fourth_bookstoreui/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class PopularAuthors extends StatelessWidget {
  const PopularAuthors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: Row(
            children: const <Widget>[
              Text(
                "Popular Authors",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Consumer<HomeScreenProvider>(builder: (context, data, child) {
          final List<ProfileCardModel> profileCardList = data.profileCardList;
          return SizedBox(
            height: 110,
            child: ListView.builder(
              itemCount: profileCardList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ReusableProfileCards(
                    authorName: profileCardList[index].authorName,
                    color: profileCardList[index].color,
                    path: profileCardList[index].image);
              },
            ),
          );
        }),
      ],
    );
  }
}
