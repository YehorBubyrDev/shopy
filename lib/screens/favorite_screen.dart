import 'package:flutter/material.dart';
import './empty_screen.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite-screen';
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (true
        ? const EmptyScreen(
            title: 'nothing here yet ...',
            icon: Icons.favorite,
          )
        : const Text("Favorite screen"));
  }
}
