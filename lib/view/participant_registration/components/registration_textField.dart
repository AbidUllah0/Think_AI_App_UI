import 'package:flutter/material.dart';
import 'package:think_ai/utils/app_colors/app_colors.dart';
import 'package:think_ai/utils/app_text_styles/text_styles.dart';
import 'package:think_ai/widget/custom_text/custom_text.dart';

class CustomTextField extends StatefulWidget {
  String hintText;
  TextEditingController controller;
  Widget? sIcon;
  Widget? pIcon;
  bool obscureText;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  String labelText;
  int? minLines;
  int? maxLines;
  ScrollController? scrollController;

  CustomTextField({
    this.pIcon,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.keyboardType,
    this.sIcon,
    this.maxLines,
    this.minLines,
    this.scrollController,
    this.obscureText = false,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: widget.labelText, style: AppTextStyles.texfFieldLabel),
        TextFormField(
          scrollController: widget.scrollController,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            fillColor: AppColors.whiteColor,
            filled: true,
            isCollapsed: true,
            prefixIcon: widget.pIcon,
            contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColors.borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColors.borderColor,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: AppTextStyles.btnTextStyle.copyWith(
              fontSize: 13,
              color: AppColors.textFieldTextColor,
            ),
            suffixIcon: widget.sIcon,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
