import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/constants.dart';
import 'package:fourth_bookstoreui/components/size_configuration.dart';
import 'package:fourth_bookstoreui/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class FavoriteBookBody extends StatelessWidget {
  const FavoriteBookBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, data, child) {
        return data.favoriteBookList.isNotEmpty
            ? ListView.builder(
                itemCount: data.favoriteBookList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 15.0),
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: SizeConfig.defaultSize * 11,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.blue, Color(0xFFDACAFB)]),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: SizeConfig.defaultSize * 1.2,
                                left: SizeConfig.defaultSize * 11.5,
                                child: Text(
                                    data.favoriteBookList[index].bookName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            SizeConfig.defaultSize * 1.8)),
                              ),
                              Positioned(
                                top: SizeConfig.defaultSize * 1.2,
                                right: SizeConfig.defaultSize * 1.2,
                                child: Text(
                                    "Rs. " +
                                        data.favoriteBookList[index].price
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize:
                                            SizeConfig.defaultSize * 1.8)),
                              ),
                              Positioned(
                                left: SizeConfig.defaultSize * 11.5,
                                top: SizeConfig.defaultSize * 4.5,
                                child: Row(
                                  children: <Widget>[
                                    Row(
                                      children: kRating,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      data.favoriteBookList[index].rating
                                          .toString(),
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.defaultSize * 1.5,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                    data.favoriteBookList[index].image),
                                fit: BoxFit.fill,
                              ),
                            ),
                            height: SizeConfig.defaultSize * 11.5,
                            width: SizeConfig.defaultSize * 7,
                          ),
                        ),
                      ],
                    ),
                  );
                })
            : const Center(
                child: Text('You don\'t have any favorite book.'),
              );
      },
    );
  }
}
