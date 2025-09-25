import 'package:eye_app/presentation/resources/color_manager.dart';
import 'package:eye_app/presentation/resources/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/text_style_manager.dart';
import '../onboarding_screen/onboarding_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static String id = 'WelcomeScreen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background_color,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyleManager.White30ExtraBold,
                children:  [
                  TextSpan(text: 'Welcome to '),
                  TextSpan(
                    text: 'Eye\n',
                    style: TextStyle(color: ColorManager.text_star_color),
                  ),
                  TextSpan(text: 'App'),
                ],
              ),
            ),
            Image.asset(ImageManager.welcome),
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, OnboardingScreen.id),
              child: Container(
                width: 157.w,
                height: 56.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text('Get start', style: TextStyleManager.White16Bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
