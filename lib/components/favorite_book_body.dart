import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/components/constants.dart';
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
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.blue, Color(0xFFDACAFB)]),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                            height: 110,
                            width: 70,
                          ),
                        ),
                        Positioned(
                          top: 30,
                          left: 100,
                          child: Text(data.favoriteBookList[index].bookName,
                              style: const TextStyle(color: Colors.white)),
                        ),
                        Positioned(
                          top: 30,
                          right: 30,
                          child: Text(
                              "Rs. " +
                                  data.favoriteBookList[index].price.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800)),
                        ),
                        Positioned(
                          left: 100,
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
                                data.favoriteBookList[index].rating.toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })
            : const Center(
                child: Text('You don\'t have any favorite books.'),
              );
      },
    );
  }
}
