import 'package:eye_app/app/extention.dart';
import 'package:eye_app/presentation/resources/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/color_manager.dart';
import '../../resources/image_manager.dart';
import '../home_screen/home_screen.dart';
import 'onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _pageIndex = 0;
  List<OnboardingModel> onboardingScreens = [
    OnboardingModel(
      title: 'Emphatic AI Wellness Chatbot For All.',
      subtitle:
          'Experience compassionate and personalized care with our AI chatbot.',
      imageUrl: ImageManager.onboarding_1,
    ),
    OnboardingModel(
      title: 'Intuitive Nutrition & Med Tracker with AI',
      subtitle:
          'Easily track your medication & nutrition with the power of AI.',
      imageUrl: ImageManager.onboarding_2,
    ),
    OnboardingModel(
      title: 'Emphatic AI Wellness Chatbot For All.',
      subtitle:
          'Experience compassionate and personalized care with our AI chatbot.',
      imageUrl: ImageManager.onboarding_3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background_color,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [buildBody(), _buildFooter()],
        ),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Spacer(),
            TextButton(
              onPressed: () => context.navigateReplacementTo(HomeScreen()),
              child: Text('skip', style: TextStyleManager.White16Medium),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Text(
                onboardingScreens[_pageIndex].title,
                style: TextStyleManager.White28ExtraBold,
                textAlign: TextAlign.left,
                maxLines: 2,
              ),
              SizedBox(height: 12.h),
              Text(
                onboardingScreens[_pageIndex].subtitle,
                style: TextStyleManager.Subtitle16Medium,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Container(
          width: 375.w,
          height: 400.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(onboardingScreens[_pageIndex].imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 22.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: _pageIndex != 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  --_pageIndex;
                });
              },
              child: Transform.flip(
                flipX: true,
                //angle: 3.14 / 1,
                child: NavigateButtun(),
              ),
            ),
          ),
          Row(
            children: List.generate(
              onboardingScreens.length,
              (index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: AnimatedContainer(
                  width: _pageIndex == index ? 40.w : 10.w,
                  height: 10.h,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: _pageIndex == index
                        ? ColorManager.primary
                        : ColorManager.gray,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (_pageIndex == onboardingScreens.length - 1) {
                  context.navigateReplacementTo(HomeScreen());
                } else {
                  ++_pageIndex;
                }
              });
            },
            child: NavigateButtun(),
          ),
        ],
      ),
    );
  }

  Widget NavigateButtun() {
    return Container(
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorManager.white,
      ),
      child: Icon(Icons.arrow_forward_ios_rounded, color: ColorManager.primary),
    );
  }
}
