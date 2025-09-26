import 'dart:developer';
import 'package:dio/dio.dart';
import '../model/signup_model.dart';

class SignupRequest {
  final Dio _dio = Dio(
    BaseOptions(
     /* baseUrl: "https://example.com/api",//ده كان هيبقى ststic baseurl لواستخدمت المتغيرده في جميع الريكويستات
      headers: {"Content-Type": "application/json"},*/
     /* connectTimeout: const Duration(seconds: 10),// الوقت المسموح للاتصال بالسيرفر
      receiveTimeout: const Duration(seconds: 10),//الوقت المسموح لارجاع النتائج*/
    ),
  );

  Future<void> signupRequest(SignupModel request) async {
    try {
      final response = await _dio.post(
        "https://example.com/api/signup",
        options: Options(
          headers: {
            "Authorization": "YOUR_TOKEN", // token
          },
        ),
        data: request.toJson(),
      );

      log("Signup Success: ${response.data}");
    } on DioException catch (e) {
      if (e.response != null) {
        log("Error: ${e.response?.statusCode} - ${e.response?.data}");
      } else {
        log("Error: ${e.message}");
      }
    }
  }
}
