import 'package:final_project_amit62/core/app_imports/app_import.dart';

class AppBarOnboardingWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final int currentIndex;
  final int lengthList;

  const AppBarOnboardingWidget(
      {super.key, required this.currentIndex, required this.lengthList});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 0.0,
      elevation: 0.0,
      backgroundColor: AppColors.whiteColor,
      centerTitle: false,
      title: Text(
        "${currentIndex + 1}/$lengthList",
        style: TextStyles.font14GreyColorBold
            .copyWith(color: AppColors.blackColor),
      ),
      actions: [
        CustomTextButton(
            title: "SKIP",
            function: () {
              SharedprefHelper.saveData(key: "onboarding", value: true);
              Navigator.pushReplacementNamed(context, Routes.loginScreen);
            })
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
