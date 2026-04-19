import 'package:flutter/material.dart';

import '../../../../app/urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../../../core/network_caller/network_response.dart';

class ProductProvider extends ChangeNotifier {

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadMore = false;
  bool get isLoadMore => _isLoadMore;

  List<dynamic> _products = [];
  List<dynamic> get products => _products;

  int _page = 1;
  final int _limit = 10;
  bool _hasMore = true;

  String _search = "";
  int? _minPrice;
  int? _maxPrice;

  /// =========================
  /// GET PRODUCTS
  /// =========================
  Future<void> getProducts({
    bool refresh = false,
    String search = "",
    int? minPrice,
    int? maxPrice,
  }) async {

    if (refresh) {
      _products.clear();
      _page = 1;
      _hasMore = true;

      _search = search;
      _minPrice = minPrice;
      _maxPrice = maxPrice;
    }

    if (!_hasMore) return;

    _isLoading = true;
    notifyListeners();

    String url =
        "${Urls.getProducts}?page=$_page&limit=$_limit&search=$_search";

    if (_minPrice != null) {
      url += "&minPrice=$_minPrice";
    }

    if (_maxPrice != null) {
      url += "&maxPrice=$_maxPrice";
    }

    final response = await NetworkCaller.getRequest(url);

    _isLoading = false;

    if (response.isSuccess && response.body != null) {

      final List data = response.body?["data"]?["results"] ?? [];

      if (data.isEmpty) {
        _hasMore = false;
      } else {
        _products.addAll(data);
        _page++;
      }

      notifyListeners();
    }
  }

  /// LOAD MORE
  Future<void> loadMore() async {

    if (_isLoadMore || !_hasMore) return;

    _isLoadMore = true;
    notifyListeners();

    await getProducts();

    _isLoadMore = false;
    notifyListeners();
  }
}