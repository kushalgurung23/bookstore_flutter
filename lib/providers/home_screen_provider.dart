import 'package:flutter/material.dart';
import 'package:fourth_bookstoreui/models/book_model.dart';
import 'package:fourth_bookstoreui/models/profile_card_model.dart';
import 'package:fourth_bookstoreui/views/book_detail.dart';
import 'package:fourth_bookstoreui/views/favorite_book.dart';
import 'package:fourth_bookstoreui/views/scan_book.dart';

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
        bookName: "I’ve never been ..",
        image: 'Images/shaenn.png',
        rating: 4.3,
        price: 450,
        isFavorite: false,
        category: 'BS1',
        offerPrice: 0,
        bookDescription:
            'I\'ve never been description. I\'ve never been description. I\'ve never been description. I\'ve never been description. I\'ve never been description. I\'ve never been description. I\'ve never been description. I\'ve never been description. I\'ve never been description. I\'ve never been description.',
        bookQuantity: 0,
        isbnNumber: 7780241491523,
        stockStatus: 'Out of Stock',
        bookAuthor: 'Kushal Gurung',
        bookGenre: [
          {'GenreImage': 'Images/autobiography.png', 'Genre': 'Autobiography'},
          {'GenreImage': 'Images/motivational.png', 'Genre': 'Motivational'}
        ],
      ),
      BookModel(
        bookAuthor: 'Barack Obama',
        bookName: "A Promised Land",
        image: 'Images/obama.png',
        rating: 4.3,
        price: 3198,
        isFavorite: false,
        category: 'BS1',
        offerPrice: 0,
        bookQuantity: 9802,
        isbnNumber: 9780241491515,
        stockStatus: 'In Stock',
        bookDescription:
            'A riveting, deeply personal account of history in the making-from the president who inspired us to believe in the power of democracy. A riveting, deeply personal account of history in the making-from the president who inspired us to believe in the power of democracy.',
        bookGenre: [
          {'GenreImage': 'Images/autobiography.png', 'Genre': 'Autobiography'},
          {'GenreImage': 'Images/motivational.png', 'Genre': 'Motivational'}
        ],
      ),
      BookModel(
        bookAuthor: 'Jim Morrision',
        bookName: "Jim Morrision",
        image: 'Images/15324.png',
        rating: 4.3,
        price: 450,
        isFavorite: false,
        category: 'BS1',
        offerPrice: 0,
        bookDescription:
            'This is the description of Jim Morrision. This is the description of Jim Morrision. This is the description of Jim Morrision. This is the description of Jim Morrision. This is the description of Jim Morrision. This is the description of Jim Morrision. This is the description of Jim Morrision. ',
        bookQuantity: 76020,
        isbnNumber: 1980241491520,
        stockStatus: 'In Stock',
        bookGenre: [
          {'GenreImage': 'Images/autobiography.png', 'Genre': 'Autobiography'},
          {'GenreImage': 'Images/motivational.png', 'Genre': 'Motivational'}
        ],
      ),
      BookModel(
        bookName: "The Classical ...",
        image: 'Images/8602.png',
        rating: 4.8,
        price: 450,
        offerPrice: 430,
        isFavorite: false,
        category: 'GTO2',
        bookDescription:
            'This is the description of the classical book. This is the description of the classical book. This is the description of the classical book. This is the description of the classical book. This is the description of the classical book. This is the description of the classical book. This is the description of the classical book. ',
        bookQuantity: 120000,
        isbnNumber: 6980241491575,
        stockStatus: 'In Stock',
        bookAuthor: 'Polar Beer',
        bookGenre: [
          {'GenreImage': 'Images/autobiography.png', 'Genre': 'Autobiography'},
          {'GenreImage': 'Images/motivational.png', 'Genre': 'Motivational'}
        ],
      ),
      BookModel(
        bookName: "Feminism is .. ",
        image: 'Images/8586.png',
        rating: 4.8,
        price: 750,
        offerPrice: 650,
        isFavorite: false,
        category: 'GTO2',
        bookDescription:
            'This is the description of the Feminism. This is the description of the Feminism. This is the description of the Feminism. This is the description of the Feminism. This is the description of the Feminism. This is the description of the Feminism. This is the description of the Feminism. This is the description of the Feminism.',
        bookQuantity: 0,
        isbnNumber: 8880241491574,
        stockStatus: 'Out of Stock',
        bookAuthor: 'Shakira Pique',
        bookGenre: [
          {'GenreImage': 'Images/autobiography.png', 'Genre': 'Autobiography'},
          {'GenreImage': 'Images/motivational.png', 'Genre': 'Motivational'}
        ],
      ),
      BookModel(
        bookName: "The Alchimist",
        image: 'Images/8586.png',
        rating: 4.8,
        price: 450,
        offerPrice: 350,
        isFavorite: false,
        category: 'GTO2',
        bookDescription:
            'This is the description of The Alchimist. This is the description of The Alchimist. This is the description of The Alchimist. This is the description of The Alchimist. This is the description of The Alchimist. This is the description of The Alchimist. This is the description of The Alchimist. This is the description of The Alchimist. ',
        bookQuantity: 290,
        isbnNumber: 9980241491546,
        stockStatus: 'In Stock',
        bookAuthor: 'Polar Beer',
        bookGenre: [
          {'GenreImage': 'Images/autobiography.png', 'Genre': 'Autobiography'},
          {'GenreImage': 'Images/motivational.png', 'Genre': 'Motivational'}
        ],
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
    favoriteBookList.addAll(favoriteList.where(
        (a) => favoriteBookList.every((b) => (a.bookName != b.bookName))));
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

  void navigateToBookDetailScreen(BuildContext context, BookModel bookModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookDetail(bookModel: bookModel)));
  }

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  void navigateToFavoriteScreen(BuildContext context) {
    Navigator.pushNamed(context, FavoriteBook.id);
  }

  void navigateToQRScanScreen(BuildContext context) {
    Navigator.pushNamed(context, ScanBook.id);
  }
}
