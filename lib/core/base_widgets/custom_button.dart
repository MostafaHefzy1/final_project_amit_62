import 'package:final_project_amit62/core/helper/spacing.dart';
import 'package:final_project_amit62/core/theming/colors.dart';
import 'package:final_project_amit62/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomMaterialButton extends StatelessWidget {
  final double? width;
  final Function function;
  final String? text;
  final double? radius;
  final Color materialColor;
  final bool borderColorSameMaterial;
  final Color textColor;
  final bool loading;
  final bool disabled; // إضافة حالة التعطيل
  final Widget? icon;

  const CustomMaterialButton({
    super.key,
    required this.function,
    required this.text,
    this.width = double.infinity,
    this.radius = 4,
    this.textColor = AppColors.whiteColor,
    this.materialColor = AppColors.primaryColor,
    this.loading = false,
    this.borderColorSameMaterial = false,
    this.disabled = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: materialColor, // لون عند التعطيل
        borderRadius: BorderRadius.circular(
          radius!,
        ),
        border: Border.all(
          width: 1.sp,
          color: borderColorSameMaterial == false
              ? AppColors.primaryColor
              : materialColor,
        ),
      ),
      child: MaterialButton(
        onPressed: (loading || disabled)
            ? null // إذا كان الزر معطلاً أو في وضع التحميل، يمنع النقر
            : () {
                function();
              },
        child: loading
            ? Center(
                child: SpinKitThreeBounce(
                  color: AppColors.whiteColor,
                  size: 1.sw < 600 ? 0.04.sh : 0.06.sh,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon == null ? const SizedBox() : icon!,
                  icon == null ? const SizedBox() : horziontalSpace(6),
                  Text(
                    text.toString(),
                    style: TextStyles.font14GreyColorBold
                        .copyWith(color: textColor),
                  ),
                ],
              ),
      ),
    );
  }
}
