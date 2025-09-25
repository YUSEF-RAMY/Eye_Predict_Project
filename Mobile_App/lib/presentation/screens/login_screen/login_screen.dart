import 'package:eye_app/presentation/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import '../../componants/custom_button.dart';
import '../../componants/custom_text_field.dart';
import '../../resources/color_manager.dart';
import '../../resources/image_manager.dart';
import '../../resources/text_style_manager.dart';
import '../signup_screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static String id = 'LoginScreen';

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
            Text('Login', style: TextStyleManager.White30ExtraBold),
            Spacer(flex: 1),
            CustomTextField(hintText: 'email'),
            SizedBox(height: 8),
            CustomTextField(hintText: 'password'),
            SizedBox(height: 20),
            CustomButton(text: 'Login',onTap: (){
              Navigator.pushReplacementNamed(context, WelcomeScreen.id,);
            },),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyleManager.White20Medium,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, SignUpScreen.id),
                  child: Text('SignUp', style: TextStyleManager.White16Medium),
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
