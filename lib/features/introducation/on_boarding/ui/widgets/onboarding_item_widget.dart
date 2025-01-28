import '../../../../../core/app_imports/app_import.dart';

class OnboardingItemWidget extends StatelessWidget {
  final String title;
  final String imageAsset;

  const OnboardingItemWidget(
      {super.key, required this.title, required this.imageAsset});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              imageAsset,
              height: 300.h,
              width: 400.w,
            ),
            Text(
              title,
              style: TextStyles.font24BlackColorBold,
            ),
            verticleSpace(10),
            Text(
              AppStrings.descOnBoarding,
              style: TextStyles.font14GreyColorBold,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
