import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/empty_screen.dart';
import '../widgets/product_item.dart';
import '../providers/products_provider/products.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = "/favorite-page";
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = productsData.favoriteItems;

    return products.isEmpty
        ? const EmptyScreen(
            title: 'Nothing here yet...',
            icon: Icons.favorite,
          )
        : GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: products.length,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
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
