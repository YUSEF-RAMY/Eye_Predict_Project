import 'package:eye_app/data/model/signup_model.dart';
import 'package:flutter/material.dart';
import '../../../data/request/signup_request.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text_field.dart';
import '../../resources/color_manager.dart';
import '../../resources/image_manager.dart';
import '../../resources/text_style_manager.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  static String id = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String userName;

  late String email;

  late String password;

  late String confirmPassword;

  @override
  Widget build(BuildContext context) {
    final signupRequest = SignupRequest();

    late final signupModel = SignupModel(
      username: userName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
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
            CustomTextField(
              hintText: 'User name',
              onchaned: (value) {
                userName = value;
              },
            ),
            SizedBox(height: 8),
            CustomTextField(
              hintText: 'Your email',
              onchaned: (value) {
                email = value;
              },
            ),
            SizedBox(height: 8),
            CustomTextField(
              hintText: 'password',
              onchaned: (value) {
                password = value;
              },
            ),
            SizedBox(height: 8),
            CustomTextField(
              hintText: 'confirm password',
              onchaned: (value) {
                confirmPassword = value;
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Signup',
              onTap: () async {
                await signupRequest.signupRequest(signupModel);
              },
            ),
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
                  child: Text('Login', style: TextStyleManager.White16Medium),
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
