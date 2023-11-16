import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:think_ai/utils/app_text_styles/text_styles.dart';
import 'package:think_ai/widget/custom_text/custom_text.dart';

import '../../../utils/app_colors/app_colors.dart';

class SelectCheckBox extends StatefulWidget {
  String checkBoxText;

  SelectCheckBox({required this.checkBoxText});

  @override
  State<SelectCheckBox> createState() => _SelectCheckBoxState();
}

class _SelectCheckBoxState extends State<SelectCheckBox> {
  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: checkValue,
          onChanged: (value) {
            setState(() {
              checkValue = value!;
            });
          },
          side: BorderSide(color: Colors.grey),
        ),
        Container(
          height: 43.h,
          width: MediaQuery.of(context).size.width * 0.29,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey),
          ),
          child: Center(
            child: CustomText(
              text: widget.checkBoxText,
              style: AppTextStyles.btnTextStyle
                  .copyWith(color: AppColors.textFieldTextColor, fontSize: 11),
            ),
          ),
        ),
      ],
    );
  }
}
