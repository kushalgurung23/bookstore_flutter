import 'package:flutter/cupertino.dart';

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

  // List of items in our dropdown menu
  var items = [
    'Top reviews',
    'All reviews',
  ];

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

}
