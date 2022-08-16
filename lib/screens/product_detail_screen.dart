import 'package:flutter/material.dart';
import '../data/mock_product_data.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = '/product-detail-screen';
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedProduct =
        mockProducts.firstWhere(((product) => product.id == productId));
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProduct.title),
      ),
    );
  }
}
