import 'package:flutter/material.dart';

import '../../utils/app_text_styles/text_styles.dart';

class CustomText extends StatelessWidget {
  final String text;
  TextStyle style;
  final TextAlign textAlign;

  CustomText(
      {super.key,
      required this.text,
      this.textAlign = TextAlign.center,
      this.style = AppTextStyles.heading1});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
