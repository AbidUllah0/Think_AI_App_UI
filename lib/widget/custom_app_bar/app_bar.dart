

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:think_ai/utils/app_images/app_images.dart';
import 'package:think_ai/utils/app_text_styles/text_styles.dart';
import 'package:think_ai/widget/custom_text/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  String ?text;
  void Function()? onPressed;
   CustomAppBar({this.text,this.onPressed,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w,right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_back_ios_new_sharp,size: 25,)),
          const Spacer(),
          CustomText(text: text.toString(),style: AppTextStyles.heading1,),
          const Spacer(),
          Image.asset(AppImages.notificationImage,width: 24.w,height: 24.h,)
        ],
      ),
    );
  }
}
