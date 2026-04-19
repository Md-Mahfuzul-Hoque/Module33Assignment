import 'dart:convert';
import 'package:http/http.dart' as http;
import 'network_response.dart';

class NetworkCaller {

  static Future<NetworkResponse> postRequest(
      String url, {
        Map<String, dynamic>? body,
        String? token,
      }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          if (token != null) "token": token,
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: 200,
          body: jsonDecode(response.body),
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: response.body,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> getRequest(
      String url, {
        String? token,
      }) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          if (token != null) "token": token,
        },
      );

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: 200,
          body: jsonDecode(response.body),
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: response.body,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }
}