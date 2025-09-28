import 'package:eye_app/presentation/resources/image_manager.dart';
import 'package:eye_app/presentation/resources/text_style_manager.dart';
import 'package:eye_app/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  static String id = 'FinishScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background_color,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Finish !!',
                style: TextStyleManager.White30ExtraBold.copyWith(fontSize: 50),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 42.0.h),
                child: Image.asset(
                  ImageManager.finish_picture,
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                },
                child: Container(
                  width: 235.w,
                  height: 56.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorManager.primary,
                  ),
                  child: Text('Try again', style: TextStyleManager.White16Bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
