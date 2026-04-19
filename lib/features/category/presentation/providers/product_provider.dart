import 'package:flutter/material.dart';

import '../../../../app/urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../../../core/network_caller/network_response.dart';

class ProductProvider extends ChangeNotifier {

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<dynamic> _products = [];
  List<dynamic> get products => _products;

  Future<void> getProducts() async {

    _isLoading = true;
    notifyListeners();

    final NetworkResponse response =
    await NetworkCaller.getRequest(Urls.getProducts);

    print("Product response: ${response.body}");
    print("Product error: ${response.errorMessage}");

    _isLoading = false;

    if (response.isSuccess && response.body != null) {


      _products = response.body?["data"]?["results"] ?? [];

      notifyListeners();
    }
  }
}