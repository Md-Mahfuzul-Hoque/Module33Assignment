import 'package:flutter/material.dart';
import '../../../../app/controllers/auth_controller.dart';
import '../../../../app/urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../../../core/network_caller/network_response.dart';

class AuthProvider extends ChangeNotifier {

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<bool> login(String email, String password) async {

    _isLoading = true;
    notifyListeners();

    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.postAuthLogin,
      body: {
        "email": email,
        "password": password,
      },
    );

    print("Login response: ${response.body}");
    print("Login error: ${response.errorMessage}");

    _isLoading = false;
    notifyListeners();

    if (response.isSuccess && response.body != null) {

      final token = response.body?["token"];

      if (token != null) {
        await AuthController.saveToken(token);
      }

      _error = null;
      return true;

    } else {
      _error = response.errorMessage ?? "Login failed";
      return false;
    }
  }


  Future<bool> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {

    _isLoading = true;
    notifyListeners();

    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.postAuthSignup,
      body: {
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
      },
    );

    print("Signup response: ${response.body}");
    print("Signup error: ${response.errorMessage}");

    _isLoading = false;
    notifyListeners();

    if (response.isSuccess && response.body != null) {
      _error = null;
      return true;
    } else {
      _error = response.errorMessage ?? "Signup failed";
      return false;
    }
  }


  Future<void> logout() async {
    await AuthController.logout();
  }
}