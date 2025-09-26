import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/text_style_manager.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.hintText,required this.onchaned});

  String? hintText;
  final ValueChanged<String> onchaned;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        hintStyle: TextStyleManager.White16Medium.copyWith(
          color: ColorManager.black,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
