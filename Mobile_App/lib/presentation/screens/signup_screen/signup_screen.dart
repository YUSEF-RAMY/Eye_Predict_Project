import 'package:flutter/material.dart';
import '../../componants/custom_button.dart';
import '../../componants/custom_text_field.dart';
import '../../resources/color_manager.dart';
import '../../resources/image_manager.dart';
import '../../resources/text_style_manager.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  static String id = 'SignUpScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background_color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Image(
              image: AssetImage(ImageManager.eye_icon),
              width: 225,
              height: 155,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 8.0),
            Text('Join the eye app!', style: TextStyleManager.White30ExtraBold),
            Text(
              'Sign up now to have your eyes examined thoroughly!',
              style: TextStyleManager.White16Medium,
              maxLines: 2,
            ),
            Spacer(flex: 1),
            CustomTextField(hintText: 'Name'),
            SizedBox(height: 8),
            CustomTextField(hintText: 'Your email'),
            SizedBox(height: 8),
            CustomTextField(hintText: 'password'),
            SizedBox(height: 20),
            CustomButton(text: 'Signup',onTap: (){Navigator.pop(context);},),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account.  ',
                  style: TextStyleManager.White20Medium,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    'Login',
                    style: TextStyleManager.White16Medium,
                  ),
                ),
              ],
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
