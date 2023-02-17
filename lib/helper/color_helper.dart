import 'package:flutter/material.dart';

class ColorHelper {
  static Color primaryColor = const Color(0xFF5151C6);
  static Color secondaryColor = const Color(0xFF888BF4);

  static LinearGradient colorLinearGradient() {
    return const LinearGradient(
      colors: [
        Color(0xFF5151C6),
        Color(0xFF888BF4),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
