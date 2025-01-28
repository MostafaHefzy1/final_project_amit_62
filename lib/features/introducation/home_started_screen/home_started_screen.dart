import 'package:final_project_amit62/core/app_imports/app_import.dart';
import 'package:flutter/services.dart';

class HomeStartedScreen extends StatelessWidget {
  const HomeStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light, // تغيير نظام شريط الحالة
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              Assets.images.startedScreen.path,
              fit: BoxFit.contain,
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "You want\nAuthentic, here \nyou go!",
                  textAlign: TextAlign.center,
                  style: TextStyles.font24BlackColorBold.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 34.sp,
                      height: 1.3),
                ),
                verticleSpace(10),
                Text(
                  "Find it here, buy it now!",
                  style: TextStyles.font14GreyColorBold,
                ),
                verticleSpace(20),
                CustomMaterialButton(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  function: () {},
                  text: "Get Started",
                ),
                verticleSpace(30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
