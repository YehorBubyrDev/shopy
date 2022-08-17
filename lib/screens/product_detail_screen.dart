import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = '/product-detail-screen';
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    List<Product> productsProvider =
        Provider.of<ProductsProvider>(context).items;
    final selectedProduct =
        productsProvider.firstWhere(((product) => product.id == productId));
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProduct.title),
      ),
    );
  }
}
