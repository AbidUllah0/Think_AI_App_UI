import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:think_ai/utils/app_text_styles/text_styles.dart';
import 'package:think_ai/view/participant_registration/components/checkbox_select.dart';
import 'package:think_ai/view/participant_registration/components/message_box_widget.dart';
import 'package:think_ai/widget/custom_app_bar/app_bar.dart';
import 'package:think_ai/widget/custom_text/custom_text.dart';

import '../../utils/app_colors/app_colors.dart';
import 'components/registration_textField.dart';

class ParticipantRegistration extends StatelessWidget {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController opinionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        toolbarHeight: 60.h,
        leading: CustomAppBar(text: "Registration"),
        leadingWidth: double.infinity,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                  controller: firstNameController,
                  hintText: 'First Name',
                  labelText: 'First Name'),
              SizedBox(height: 14),
              CustomTextField(
                  controller: firstNameController,
                  hintText: 'Last Name',
                  labelText: 'Last Name'),
              SizedBox(height: 14),

              CustomTextField(
                  controller: firstNameController,
                  hintText: 'Father Name',
                  labelText: 'Father Name'),
              SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: firstNameController,
                        hintText: 'Date Of Birth',
                        labelText: 'DOB'),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: CustomTextField(
                        controller: firstNameController,
                        hintText: 'Gender',
                        labelText: 'Gender'),
                  ),
                ],
              ),
              SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: firstNameController,
                        hintText: 'Department',
                        labelText: 'Department'),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: CustomTextField(
                        controller: firstNameController,
                        hintText: 'Working Experience',
                        labelText: 'Working Experience'),
                  ),
                ],
              ),
              SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: firstNameController,
                        hintText: 'Status',
                        labelText: 'Status'),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: CustomTextField(
                        controller: firstNameController,
                        hintText: 'Interests',
                        labelText: 'Interests'),
                  ),
                ],
              ),
              SizedBox(height: 14),

              CustomText(
                text: 'Do you want join this event ?',
                style: AppTextStyles.texfFieldLabel,
              ),
              SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: SelectCheckBox(
                      checkBoxText: 'With Your Identity',
                    ),
                  ),
                  Expanded(
                    child: SelectCheckBox(
                      checkBoxText: 'Anonymously',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),

              CustomText(
                text: 'Share Your Opinion',
                style: AppTextStyles.texfFieldLabel,
              ),
              MessageBoxWidget(),
              // CustomTextField(
              //     // minLines: 1,
              //     maxLines: 5,
              //     controller: opinionController,
              //     hintText: 'Entry your Message',
              //     pIcon: Icon(
              //       Icons.keyboard_voice_outlined,
              //       color: Colors.grey,
              //     ),
              //     sIcon: IconButton(
              //       onPressed: () {},
              //       icon: Icon(
              //         Icons.send,
              //         color: AppColors.btnColor,
              //       ),
              //     ),
              //     labelText: 'Share Your Opinion'),
            ],
          ),
        ),
      ),
    );
  }
}
