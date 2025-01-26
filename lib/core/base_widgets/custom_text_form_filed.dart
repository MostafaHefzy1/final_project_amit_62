
import 'package:final_project_amit62/core/theming/colors.dart';
import 'package:final_project_amit62/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends StatelessWidget {
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType textInputType;
  final bool wantDigitOnly;
  const CustomTextFormField(
      {super.key,
      this.focusedBorder,
      this.enabledBorder,
      this.textInputType = TextInputType.text,
      this.inputTextStyle,
      this.hintStyle,
      required this.hintText,
      this.isObscureText,
      this.prefixIcon,
      this.suffixIcon,
      this.backgroundColor,
      this.controller,
      required this.validator,
      this.wantDigitOnly = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      
      cursorColor: AppColors.primaryColor,
      inputFormatters: wantDigitOnly != false
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ]
          : null,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.greyColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.greyColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintStyle: hintStyle ?? TextStyles.font12GreyColorBold,
        hintText: hintText,
        suffixIcon: suffixIcon,
        
        // prefix:prefixIcon ,
        prefixIcon: prefixIcon,
        fillColor: backgroundColor ?? AppColors.lightGreyColor,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style:
          TextStyles.font12GreyColorBold.copyWith(color: AppColors.primaryColor),
      validator: (value) {
        return validator(value);
      },
    );
  }
}