import 'package:dio/dio.dart';
import 'package:eye_app/presentation/components/old_pictures_builder.dart';
import 'package:eye_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../data/response/get_all_images_results_response.dart';

class OldPictureScreen extends StatefulWidget {
  const OldPictureScreen({super.key});

  @override
  State<OldPictureScreen> createState() => _OldPictureScreenState();
}

class _OldPictureScreenState extends State<OldPictureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background_color,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            OldPicturesBuilder()
          ],
        ),
      ),
    );
  }
}
