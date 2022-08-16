import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import './product_detail_screen.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static String routeName = '/products-overview-screen';
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> productsProvider =
        Provider.of<ProductsProvider>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "- Shopy -",
          style: TextStyle(fontSize: 36),
        ),
      ),
      body: ProductGrid(productsProvider: productsProvider),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
    required this.productsProvider,
  }) : super(key: key);

  final List<Product> productsProvider;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: productsProvider.length,
      itemBuilder: (context, index) => ProductItem(
        productsProvider[index].id,
        productsProvider[index].title,
        productsProvider[index].description,
        productsProvider[index].imageUrl,
        productsProvider[index].price,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 15,
        mainAxisSpacing: 10,
      ),
    );
  }
}
