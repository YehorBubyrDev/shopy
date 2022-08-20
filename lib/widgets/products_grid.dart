import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/widgets/empty_sreen.dart';
import './product_item.dart';
import '../providers/products_provider/products.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavorite;
  const ProductGrid(this.showFavorite, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products =
        showFavorite ? productsData.favoriteItems : productsData.items;

    return products.isEmpty
        ? const EmptyScreen()
        : GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: products.length,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
              // create: (context) => products[index],
              value: products[index],
              child: ProductItem(),
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
