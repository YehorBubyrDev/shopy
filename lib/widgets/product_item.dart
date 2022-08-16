import "package:flutter/material.dart";
import 'package:shopy/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final num price;
  final String imgUrl;

  const ProductItem(
    this.id,
    this.title,
    this.description,
    this.imgUrl,
    this.price, {
    Key? key,
  }) : super(key: key);

  void selectProduct(BuildContext context) {
    Navigator.of(context).pushNamed(
      ProductDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ((() => selectProduct(context))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          header: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: (() => {}),
                color: Theme.of(context).colorScheme.secondary),
            title: Text(
              "$price",
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: (() => {}),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
