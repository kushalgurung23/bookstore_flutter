import 'package:flutter/cupertino.dart';
import 'package:fourth_bookstoreui/models/review_model.dart';

class BookDetailScreenProvider extends ChangeNotifier {
  late int _selectedBookNumber = 1;

  int get selectedBookNumber => _selectedBookNumber;

  void increaseBookNumber() {
    if (_selectedBookNumber >= 1) {
      _selectedBookNumber++;
    }
    notifyListeners();
  }

  void decreaseBookNumber() {
    if (_selectedBookNumber > 1) {
      _selectedBookNumber--;
    }
    notifyListeners();
  }

  // Initial Selected Value
  String dropDownValue = 'Top reviews';

  void changeDropDownValue(String newValue) {
    dropDownValue = newValue;
    notifyListeners();
  }

  // List of items in our dropdown menu
  var items = [
    'Top reviews',
    'All reviews',
  ];

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  List<ReviewModel> _review = [];
  List<ReviewModel> get review => List.from(_review);

  void loadReview() {
    List<ReviewModel> reviewModel = [
      ReviewModel(
        userImage: 'Images/profile1.png',
        fullName: 'Garth Stein',
        review:
            'A riveting, deeply personal account of history in the making-from the president who inspired us to believe in the power of democracyA riveting, deeply personal account of history in the making-from the president who inspired us to believe in the power of democracy',
        rating: 4.3,
        date: DateTime(2020, 11, 8),
      ),
      ReviewModel(
        userImage: 'Images/profile2.png',
        fullName: 'Jacqueline R.',
        review:
            'I am currently reading through the book. It is really extensive and you will need to aside some time to finish it.',
        rating: 4.3,
        date: DateTime(2021, 01, 09),
      ),
    ];
    _review = reviewModel;
  }
}
