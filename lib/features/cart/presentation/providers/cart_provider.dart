import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {

  final List<Map> _cartItems = [];
  List<Map> get cartItems => _cartItems;

  void addToCart(Map product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}