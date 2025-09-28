import 'package:eye_app/presentation/resources/image_manager.dart';
import 'package:eye_app/presentation/resources/text_style_manager.dart';
import 'package:eye_app/presentation/screens/finish_screen/finish_screen.dart';
import 'package:eye_app/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/color_manager.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  static String id = 'ResultsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background_color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, FinishScreen.id);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: ColorManager.white,
                      size: 34,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Container(
                height: 390.h,
                width: double.infinity,
                child: Image.network(
                  HomeScreen.imageResultModel.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Text('Result: ', style: TextStyleManager.White30ExtraBold),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Accuracy  :   ${HomeScreen.imageResultModel.accuracy}',
                style: TextStyleManager.White20Medium,
              ),
              SizedBox(height: 8.h),
              Container(
                width: 175.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: resultColor(HomeScreen.imageResultModel.result),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(HomeScreen.imageResultModel.result),
              ),
              SizedBox(height: 8.h),
              Text('thank you', style: TextStyleManager.White16Medium),
            ],
          ),
        ),
      ),
    );
  }
}

Color resultColor(String x) {
  Color y;
  switch (x) {
    case 'cataract':
      {
        y = ColorManager.gray;
        break;
      }
    case 'diabetic_retinopathy':
      {
        y = ColorManager.red;
        break;
      }
    case 'glaucoma':
      {
        y = ColorManager.red;
        break;
      }
    case 'normal':
      {
        y = ColorManager.green;
        break;
      }
    default:
      {
        y = ColorManager.white;
        break;
      }
  }
  return y;
}
