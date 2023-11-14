import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF1C1C1E);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color bgColor = Color(0xFFFFFFFF);

  ///Text Colors
  static const Color textColor1 = Color(0xFF3871C1);
  static const Color textColor2 = Color(0xFF5CB5F9);

  ///Button Color
  static const Color btnColor = Color(0xFF3871C1);
  static const Color btnTextColor = Color(0xFFFFFFFF);

  ///Gradient color
  static LinearGradient textGradient = const LinearGradient(
    begin: Alignment(0.90, -2.10),
    end: Alignment(0.7, -4.00),
    colors: [AppColors.primaryColor, AppColors.whiteColor],
  );
}
