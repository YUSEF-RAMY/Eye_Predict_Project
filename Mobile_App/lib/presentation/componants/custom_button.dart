import 'dart:ffi';

import 'package:eye_app/presentation/resources/text_style_manager.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.text, required this.onTap});

  final VoidCallback onTap;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyleManager.White16Bold.copyWith(
            color: ColorManager.black,
          ),
        ),
      ),
    );
  }
}
