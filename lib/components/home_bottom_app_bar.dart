import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeBottomAppBar extends StatelessWidget {
  const HomeBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0x00000000).withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 20,
              offset: const Offset(0, -10), // changes position of shadow
            ),
          ],
        ),
        height: 70,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.home_outlined,
                          color: Colors.black87),
                      iconSize: 30,
                    ),
                    IconButton(
                      onPressed: () {
                        Provider.of<HomeScreenProvider>(context, listen: false)
                            .navigateToFavoriteScreen(context);
                      },
                      icon: const Icon(Icons.favorite_border,
                          color: Colors.black87),
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none_sharp,
                        color: Colors.black87,
                      ),
                      iconSize: 30,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person_outline,
                          color: Colors.black87),
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
