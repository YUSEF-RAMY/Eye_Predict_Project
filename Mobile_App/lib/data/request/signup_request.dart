import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:eye_app/data/model/signup_response_model.dart';
import 'package:eye_app/main.dart';
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
  SignupResponseModel? signupResponseModel;

  Future<String> signupRequest(SignupModel request) async {
    try {
      final response = await _dio.post(
        "${EyeApp.baseUrl}/api/register",
        options: Options(
          headers: {
            "Accept": "application/json", // token
          },
        ),
        data: request.toJson(),
      );
      log("Signup Success: ${response.data}");
      signupResponseModel = SignupResponseModel.fromjson(response.data);
      EyeApp.success = true;
      return signupResponseModel!.token;
    } on DioException catch (e) {
      if (e.response != null) {
        log("Error: ${e.response?.statusCode} - ${e.response?.data}");
        EyeApp.success = false;
        throw Exception(e.message);
      } else {
        log("Error: ${e.message}");
        EyeApp.success = false;
        throw Exception(e.message);
      }
    }
  }
}
