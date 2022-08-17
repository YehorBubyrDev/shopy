import 'package:flutter/material.dart';
import './product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
      description:
          'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',
      price: 29.99,
      discountPercentage: 10,
      brand: 'Fjallraven',
      category: ProductCategories.ForMen,
      rating: 10,
      imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Mens Casual Premium Slim Fit T-Shirts',
      description:
          'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.',
      price: 59.99,
      discountPercentage: 10,
      brand: 'Jack & Jonson',
      category: ProductCategories.ForMen,
      rating: 10,
      imageUrl:
          'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Mens Cotton Jacket',
      description:
          'great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.',
      price: 19.99,
      discountPercentage: 10,
      brand: 'Armani',
      category: ProductCategories.ForMen,
      rating: 10,
      imageUrl: 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Mens Casual Slim Fit',
      description:
          'The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.',
      price: 49.99,
      discountPercentage: 10,
      brand: 'H&M',
      category: ProductCategories.ForMen,
      rating: 10,
      imageUrl: 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
    ),
    Product(
      id: 'p5',
      title:
          'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet',
      description:
          'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.',
      price: 49.99,
      discountPercentage: 10,
      brand: 'H&M',
      category: ProductCategories.Jewelery,
      rating: 10,
      imageUrl:
          'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Solid Gold Petite Micropave',
      description:
          'Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.',
      price: 49.99,
      discountPercentage: 10,
      brand: 'Gold century',
      category: ProductCategories.Jewelery,
      rating: 10,
      imageUrl:
          'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  void addProduct(Product newProduct) {
    _items.add(newProduct);
    notifyListeners();
  }

  void removeProduct(String productId) {
    _items.removeWhere((product) => product.id == productId);
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }
}