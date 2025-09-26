import 'package:dio/dio.dart';
import 'package:eye_app/data/model/login_model.dart';
import 'package:eye_app/data/request/login_request.dart';
import 'package:flutter/material.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';
import '../../resources/color_manager.dart';
import '../../resources/image_manager.dart';
import '../../resources/text_style_manager.dart';
import '../signup_screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static String id = 'LoginScreen';
  late String email;

  late String password;

  @override
  Widget build(BuildContext context) {
    final loginRequest = LoginRequest(Dio());
    late final loginModel = LoginModel(email: email, password: password);
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
            CustomTextField(hintText: 'email', onchaned: (value) {}),
            SizedBox(height: 8),
            CustomTextField(hintText: 'password', onchaned: (value) {}),
            SizedBox(height: 20),
            CustomButton(
              text: 'Login',
              onTap: () async {
                await loginRequest.loginRequest(loginModel);
              },
            ),
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
