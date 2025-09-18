import 'dart:io';
import 'package:dio/dio.dart';

Future<void> UploadImageRequest(File imageFile) async {
  final dio = Dio();

  try {
    String fileName = imageFile.path.split('/').last;

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(imageFile.path, filename: fileName),
    });

    final response = await dio.post(
      "https://example.com/upload", //  لينك الـ API
      data: formData,
      options: Options(
        headers: {
          "Authorization": "YOUR_TOKEN", // token
          "Content-Type": "", //multipart/form-data
        },
      ),
    );

    if (response.statusCode == 200) {
      print("upload image successfully");
      print(response.data);
    } else {
      print(" error: ${response.statusCode}");
    }
  } catch (e) {
    print(" Exception: $e");
  }
}
