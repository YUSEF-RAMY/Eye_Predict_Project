import 'dart:developer';
import 'package:dio/dio.dart';
import '../../main.dart';
import '../model/old_picture_model.dart';

class GetAllImagesResultsResponse {
  final Dio dio;

  GetAllImagesResultsResponse(this.dio);

  Future<List<OldPictureModel>> getAllImagesResultsResponse() async {
    Response response = await dio.get(
      '${EyeApp.baseUrl}/api/get/scan',
      options: Options( headers: {
        "Authorization": "Bearer ${EyeApp.token}",
        "Accept": "application/json",
      },),
    );
    try {
      List<Map<String,dynamic>> listOldPictures = response.data;
      List<OldPictureModel> oldPictures = [];
      for(var x in listOldPictures){
        OldPictureModel oldPictureModel = OldPictureModel.fromjson(x);
        oldPictures.add(oldPictureModel);
      }
      EyeApp.success=true;
      log(oldPictures as String);
      return oldPictures;
    } on DioException catch (e) {
      log(e.toString());
      String errMessage =
          e.response?.data['error']['message'] ??
          'Oops there was an error, Try later!';
      EyeApp.success=false;
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      EyeApp.success=false;
      throw Exception('try later!');
    }
  }
}
