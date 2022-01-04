import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/models/book_model.dart';
import 'package:fourth_bookstoreui/models/profile_card_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<BookModel> _allBookList = [];
  List<BookModel> _bestSellerBookList = [];
  List<BookModel> _grabTheseOfferBookList = [];

  List<BookModel> get allBookList => List.from(_allBookList);
  List<BookModel> get bestSellerBookList => List.from(_bestSellerBookList);
  List<BookModel> get grabTheseOfferBookList =>
      List.from(_grabTheseOfferBookList);

  void getBookList() {
    List<BookModel> bookList = [
      BookModel(
          bookDescription: "I’ve never been ..",
          image: 'Images/shaenn.png',
          rating: 4.3,
          price: 450,
          isFavorite: false,
          category: 'BS1',
          offerPrice: 0),
      BookModel(
          bookDescription: "A Promised Land",
          image: 'Images/obama.png',
          rating: 4.3,
          price: 3198,
          isFavorite: false,
          category: 'BS1',
          offerPrice: 0),
      BookModel(
          bookDescription: "Jim Morrision",
          image: 'Images/15324.png',
          rating: 4.3,
          price: 450,
          isFavorite: false,
          category: 'BS1',
          offerPrice: 0),
      BookModel(
        bookDescription: "The Classical ...",
        image: 'Images/8602.png',
        rating: 4.8,
        price: 450,
        offerPrice: 430,
        isFavorite: false,
        category: 'GTO2',
      ),
      BookModel(
        bookDescription: "Feminism is .. ",
        image: 'Images/8586.png',
        rating: 4.8,
        price: 750,
        offerPrice: 650,
        isFavorite: false,
        category: 'GTO2',
      ),
      BookModel(
        bookDescription: "The Alchimist",
        image: 'Images/8586.png',
        rating: 4.8,
        price: 450,
        offerPrice: 350,
        isFavorite: false,
        category: 'GTO2',
      ),
    ];

    // List of all books
    _allBookList = bookList;

    // List to store books of 'Best Sellers' category
    List<BookModel> bestList = [];

    // List to store books of 'Get These Offers' category
    List<BookModel> offerList = [];

    for (var book in bookList) {
      if (book.category == 'BS1') {
        bestList.add(book);
      } else if (book.category == 'GTO2') {
        offerList.add(book);
      }
    }

    _bestSellerBookList = bestList;
    _grabTheseOfferBookList = offerList;
  }

  // This list is used in favorite_book screen to display favorite book list.
  List<BookModel> favoriteBookList = [];

  // To change favorite status of books
  void changeFavoriteStatus({required BookModel bookModel}) {
    if (bookModel.isFavorite == true) {
      bookModel.isFavorite = false;
      favoriteBookList.remove(bookModel);
      notifyListeners();
    } else if (bookModel.isFavorite == false) {
      bookModel.isFavorite = true;
      notifyListeners();
    }
  }

  // This method will be called in initState of favorite_book screen to add books in favoriteBookList.
  void addFavoriteBooks() {
    List<BookModel> favoriteList = [];
    for (var data in allBookList) {
      if (data.isFavorite == true) {
        favoriteList.add(data);
      }
    }
    favoriteBookList.addAll(favoriteList.where((a) => favoriteBookList
        .every((b) => (a.bookDescription != b.bookDescription))));
  }

  List<ProfileCardModel> _profileCardList = [];
  List<ProfileCardModel> get profileCardList => List.from(_profileCardList);

  // Assigning profile card model values in a list.
  void getProfileCardList() {
    List<ProfileCardModel> profileList = [
      ProfileCardModel(
          authorName: "Paulo Cohelo",
          image: 'Images/Ellipse.png',
          color: Colors.green),
      ProfileCardModel(
          authorName: "Chetan Bhagat",
          image: 'Images/Ellipse1.png',
          color: Colors.orange),
      ProfileCardModel(
          authorName: "Laura Dave",
          image: 'Images/Ellipse2.png',
          color: Colors.pink),
      ProfileCardModel(
          authorName: "Amor Towles",
          image: 'Images/Ellipse3.png',
          color: Colors.redAccent),
      ProfileCardModel(
          authorName: "Andy Weir",
          image: 'Images/Ellipse1.png',
          color: Colors.blue),
      ProfileCardModel(
          authorName: "Subin Bhattarai",
          image: 'Images/Ellipse2.png',
          color: Colors.yellow),
    ];
    _profileCardList = profileList;
  }
}
