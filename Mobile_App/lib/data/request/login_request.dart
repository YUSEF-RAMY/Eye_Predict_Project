import 'dart:developer';
import 'package:dio/dio.dart';
import '../model/login_model.dart';

class LoginRequest {
  final Dio _dio;

  LoginRequest(this._dio);

  Future<void> loginRequest(LoginModel request) async {
    try {
      final response = await _dio.post(
        "https://example.com/api/login",
        options: Options(
          headers: {
            "Authorization": "YOUR_TOKEN", // token
          },
        ),
        data: request.toJson(),
      );

      log("Login Success: ${response.data}");
    } on DioException catch (e) {
      if (e.response != null) {
        log("Error: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        log("Error: ${e.message}");
      }
    }
  }
}
