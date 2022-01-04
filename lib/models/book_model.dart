class BookModel {
  final String bookDescription, image, category;
  final double rating;
  final int price, offerPrice;
  late bool isFavorite;

  BookModel({
    required this.bookDescription,
    required this.image,
    required this.rating,
    required this.price,
    required this.isFavorite,
    required this.category,
    required this.offerPrice,
  });
}
