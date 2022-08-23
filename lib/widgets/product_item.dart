import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../providers/products_provider/product.dart';
import '../screens/product_detail_screen.dart';
import '../providers/cart_provider/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: (() => {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: product.id)
            }),
        child: GridTile(
          header: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
              builder: (context, value, child) =>
                  FavoriteButton(product: product),
            ),
            title: Text(
              '\$${product.price.toString()}',
              textAlign: TextAlign.center,
            ),
            trailing: Consumer<Product>(
              builder: (context, value, child) =>
                  CartButton(cart: cart, product: product),
            ),
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
    required this.cart,
    required this.product,
  }) : super(key: key);

  final CartProvider cart;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: (() => {
            cart.addItem(product.id, product.title, product.price),
            ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text(
                'Added to cart!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              action: SnackBarAction(
                  textColor: Colors.black,
                  label: 'UNDO',
                  onPressed: () {
                    cart.removeItem(product.id);
                  }),
              backgroundColor: Colors.cyanAccent,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(milliseconds: 2000),
            ))
          }),
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: product.isFavorite
            ? const Icon(
                Icons.favorite,
                color: Colors.pink,
              )
            : const Icon(Icons.favorite_outline),
        onPressed: (() => product.isFavorite
            ? {product.toggleFavoriteStatus()}
            : {
                product.toggleFavoriteStatus(),
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text(
                    'Added to favorite!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  action: SnackBarAction(
                      textColor: Colors.white,
                      label: 'UNDO',
                      onPressed: () {
                        product.toggleFavoriteStatus();
                      }),
                  backgroundColor: Colors.pink,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(milliseconds: 2000),
                ))
              }),
        color: Theme.of(context).colorScheme.secondary);
  }
}
