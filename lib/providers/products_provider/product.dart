import 'package:flutter/foundation.dart';

enum ProductCategories {
  Jewelery,
  ForMen,
  ForWomen,
  Accesiarites,
  Unknown,
}

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final num? discountPercentage;
  final num? rating;
  final String brand;
  final ProductCategories category;
  final String imageUrl;
  bool isFavorite;
  bool inCart;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.discountPercentage,
    this.rating,
    required this.brand,
    required this.category,
    required this.imageUrl,
    this.isFavorite = false,
    this.inCart = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void toggleInCartStatus() {
    inCart = !inCart;
    notifyListeners();
  }
}
