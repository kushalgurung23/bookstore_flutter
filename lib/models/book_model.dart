class BookModel {
  final String bookName,
      image,
      category,
      bookDescription,
      stockStatus,
      bookAuthor;
  final double rating;
  final int price, offerPrice, isbnNumber, bookQuantity;
  late bool isFavorite;
  final List<Map<String, dynamic>> bookGenre;

  BookModel({
    required this.bookGenre,
    required this.bookAuthor,
    required this.bookDescription,
    required this.stockStatus,
    required this.bookQuantity,
    required this.isbnNumber,
    required this.bookName,
    required this.image,
    required this.rating,
    required this.price,
    required this.isFavorite,
    required this.category,
    required this.offerPrice,
  });
}
