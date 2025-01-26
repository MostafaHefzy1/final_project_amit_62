

import 'package:final_project_amit62/core/app_imports/app_import.dart';
import 'package:final_project_amit62/core/theming/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void customBottomSheet(
    {required BuildContext context,
    double? sizedHigh,
    required Widget child,
    double padding = 15,
    isDismissible = true}) {
  showBarModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: AppColors.whiteColor,
      isDismissible: isDismissible,
      topControl: Container(),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return AnimatedPadding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          duration: const Duration(milliseconds: 250),
          child: Container(
            width: double.infinity,
            height: sizedHigh ?? 0.8.sw,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: AppColors.whiteColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10.h,
                    ),
                    width: 80.w,
                    height: 6.h,
                    decoration: const BoxDecoration(
                      color: AppColors.lightGreyColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        );
      });
}