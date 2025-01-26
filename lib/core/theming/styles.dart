import 'package:final_project_amit62/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24BlackColorBold = TextStyle(
      fontSize: 24.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold);
  static TextStyle font16BlackColorMeduim = TextStyle(
      fontSize: 16.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500);

  static TextStyle font14GreyColorBold = TextStyle(
      fontSize: 14.sp, color: AppColors.greyColor, fontWeight: FontWeight.w500);

  static TextStyle font12GreyColorBold = TextStyle(
      fontSize: 12.sp, color: AppColors.greyColor, fontWeight: FontWeight.w500);

  static TextStyle font14PrimaryColorColorBold = TextStyle(
      fontSize: 14.sp,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w500);

  static TextStyle font14RedColorColorBold = TextStyle(
      fontSize: 14.sp, color: Colors.red, fontWeight: FontWeight.w500);
}
