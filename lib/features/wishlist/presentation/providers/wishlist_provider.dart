import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {

  final List<Map> _items = [];
  List<Map> get items => _items;

  void addToWishlist(Map product) {
    _items.add(product);
    notifyListeners();
  }

  void removeFromWishlist(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}