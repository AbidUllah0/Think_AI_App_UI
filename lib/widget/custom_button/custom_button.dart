
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:think_ai/utils/app_text_styles/text_styles.dart';


import '../custom_text/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Function onPressed;


   CustomButton({super.key,
    required this.text,

    this.backgroundColor= const Color(0xff51BCD3),
    required this.onPressed,

    this.textColor = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35.h,
      decoration: BoxDecoration(
        color: backgroundColor,
       borderRadius: BorderRadius.circular(5.r),
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: CustomText(
          text: text,
          style: AppTextStyles.btnTextStyle,

        ),
      ),
    );
  }
}