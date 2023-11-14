



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:think_ai/utils/app_colors/app_colors.dart';

import '../../widget/custom_app_bar/app_bar.dart';

class ParticipantsVoteScreen extends StatelessWidget {
  const ParticipantsVoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        toolbarHeight: 60.h,
        leading: CustomAppBar(text: "Circle Leader Vote"),
        leadingWidth: double.infinity,
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.w
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h,),

          ],
        ),
      ),
    );
  }
}
