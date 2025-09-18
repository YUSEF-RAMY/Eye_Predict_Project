import 'package:flutter/material.dart';

extension ContextExtention on BuildContext {
  void navigateReplacementTo(Widget widget) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}