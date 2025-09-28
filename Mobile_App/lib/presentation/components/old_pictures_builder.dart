import 'package:dio/dio.dart';
import 'package:eye_app/data/model/old_picture_model.dart';
import 'package:eye_app/data/response/get_all_images_results_response.dart';
import 'package:eye_app/presentation/components/old_picture_list.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class OldPicturesBuilder extends StatefulWidget {
  const OldPicturesBuilder({super.key});

  @override
  State<OldPicturesBuilder> createState() => _OldPicturesBuilderState();
}

class _OldPicturesBuilderState extends State<OldPicturesBuilder> {
  var future;

  @override
  void initState() {
    super.initState();
    future = GetAllImagesResultsResponse(Dio()).getAllImagesResultsResponse();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OldPictureModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return OldPictureList(oldPictures: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(child: Text("Not Found oldPicture")),
          );
        } else {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Column(
                children: [
                  Spacer(flex: 1),
                  Center(
                    child: CircularProgressIndicator(color: ColorManager.black),
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
