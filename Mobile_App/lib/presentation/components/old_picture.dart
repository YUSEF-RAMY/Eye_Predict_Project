import 'package:eye_app/data/model/old_picture_model.dart';
import 'package:eye_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/text_style_manager.dart';

class OldPicture extends StatelessWidget {
  final OldPictureModel item;

  const OldPicture({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                item.image,
                fit: BoxFit.cover,
                height: 144.h,
                width: 172.w,
              ),
              Container(
                width: 172,
                height: 92,
                color: ColorManager.white,
                child: Column(
                  children: [
                    Text(
                      'Accuracy:  ${item.accuracy}',
                      style: TextStyleManager.White16Medium.copyWith(
                        color: ColorManager.black,
                      ),
                    ),
                    Text(
                      'Result:  ${item.result}',
                      style: TextStyleManager.White16Medium.copyWith(
                        color: ColorManager.black,
                      ),
                    ),
                    Text(
                      item.date,
                      style: TextStyleManager.White16Medium.copyWith(
                        color: ColorManager.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
