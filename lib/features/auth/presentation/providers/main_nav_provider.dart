import 'package:flutter/material.dart';

class MainNavProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void backToHome() {
    _selectedIndex = 0;
    notifyListeners();
  }

  void moveToCategory() {
    _selectedIndex = 1;
    notifyListeners();
  }
}