import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static String routeName = '/products-overview-screen';
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shopy",
          style: TextStyle(fontSize: 36),
        ),
      ),
      body: const ProductGrid(),
    );
  }
}
