import 'package:flutter/material.dart';

import '../app_colors/app_colors.dart';

class AppTextStyles {
  ///Heading Styles
  static const TextStyle heading1 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor1,
  );

  ///Button Text Styles
  static const TextStyle btnTextStyle = TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.btnTextColor,
  );

  static TextStyle texfFieldLabel = TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textFieldlabelColor,
  );
}
