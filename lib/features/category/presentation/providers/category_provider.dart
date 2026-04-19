import 'package:flutter/material.dart';

import '../../../../app/urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../../../core/network_caller/network_response.dart';

class CategoryProvider extends ChangeNotifier {

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<dynamic> _categories = [];
  List<dynamic> get categories => _categories;

  Future<void> getCategories() async {

    _isLoading = true;
    notifyListeners();

    final NetworkResponse response =
    await NetworkCaller.getRequest(Urls.getCategories);

    print("Category response: ${response.body}");
    print("Category error: ${response.errorMessage}");

    _isLoading = false;

    if (response.isSuccess && response.body != null) {

      _categories = response.body?["data"]?["results"] ?? [];

      notifyListeners();
    }
  }
}