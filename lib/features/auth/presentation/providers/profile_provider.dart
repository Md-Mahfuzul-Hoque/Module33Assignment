import 'package:flutter/material.dart';

import '../../../../app/urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../../../core/network_caller/network_response.dart';

class ProfileProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, dynamic>? _profile;
  Map<String, dynamic>? get profile => _profile;

  String? _error;
  String? get error => _error;

  Future<bool> getProfile() async {
    _isLoading = true;
    notifyListeners();

    final NetworkResponse response =
    await NetworkCaller.getRequest(
      Urls.getAuthProfile,
    );

    print("Profile response: ${response.body}");
    print("Profile error: ${response.errorMessage}");

    _isLoading = false;

    if (response.isSuccess && response.body != null) {
      _profile = response.body?["data"] ?? response.body;
      _error = null;
      notifyListeners();
      return true;
    } else {
      _error = response.errorMessage ?? "Failed to load profile";
      notifyListeners();
      return false;
    }
  }
}