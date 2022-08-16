import 'package:flutter/material.dart';

class PizzaProvider extends ChangeNotifier {
  int numberOfPizza;

  PizzaProvider({this.numberOfPizza = 0});

  void changeNumberOfPizza(int newValue) {
    numberOfPizza = newValue;
    notifyListeners();
  }
}
