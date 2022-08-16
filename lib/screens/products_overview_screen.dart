import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
import '../data/mock_product_data.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static String routeName = '/products-overview-screen';
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "- Shopy -",
          style: TextStyle(fontSize: 36),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: mockProducts.length,
        itemBuilder: (context, index) => ProductItem(
          mockProducts[index].id,
          mockProducts[index].title,
          mockProducts[index].description,
          mockProducts[index].imageUrl,
          mockProducts[index].price,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 15,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
