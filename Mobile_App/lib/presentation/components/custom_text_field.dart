import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/text_style_manager.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.hintText,required this.controller});

  String? hintText;
  //final ValueChanged<String> onchaned;
  final controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
