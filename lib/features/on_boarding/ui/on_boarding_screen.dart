import 'package:final_project_amit62/features/on_boarding/ui/widgets/app_bar_onboarding_widget.dart';

import '../../../core/app_imports/app_import.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<OnboardingItemModel> listOnboardingItemModel = [
      OnboardingItemModel(
        image: Assets.images.onboarding1,
        title: "Choose Products",
      ),
      OnboardingItemModel(
        image: Assets.images.onboarding2,
        title: "Make Payment",
      ),
      OnboardingItemModel(
        image: Assets.images.onboaring3,
        title: "Get Your Order",
      )
    ];
    PageController controller = PageController();
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          var cubit = OnBoardingCubit.get(context);
          return Scaffold(
            appBar:AppBarOnboardingWidget(
              currentIndex: cubit.currentIndex,
              lengthList: listOnboardingItemModel.length,
            ),
            body: PageView.builder(
              onPageChanged: (int index) {
                cubit.changeIndex(index);
              },
              controller: controller,
              itemBuilder: (context, index) => Column(
                children: [
                  const Spacer(),
                  OnboardingItemWidget(
                    imageAsset: listOnboardingItemModel[index].image,
                    title: listOnboardingItemModel[index].title,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextButton(
                        function: () {
                          if (cubit.currentIndex == 0) {
                            return;
                          } else {
                            controller.previousPage(
                                duration: Durations.medium2,
                                curve: Curves.bounceOut);
                          }
                        },
                        title: "Prev",
                        color: AppColors.greyColor,
                      ),
                      const Spacer(),
                      SmoothPageIndicator(
                          controller: controller, // PageController
                          count: listOnboardingItemModel.length,
                          effect: const ExpandingDotsEffect(
                            activeDotColor: AppColors.darkBlueColor,
                          ),
                          onDotClicked: (index) {
                            controller.animateToPage(index,
                                duration: Durations.medium1,
                                curve: Curves.bounceIn);
                          }),
                      const Spacer(),
                      CustomTextButton(
                        function: () {
                          if (cubit.currentIndex == 2) {
                            SharedprefHelper.saveData(
                                key: "onboarding", value: true);
                            Navigator.pushReplacementNamed(
                                context, Routes.loginScreen);
                          } else {
                            controller.nextPage(
                                duration: Durations.medium2,
                                curve: Curves.bounceIn);
                          }
                        },
                        title: cubit.currentIndex == 2 ? "Get Started" : "Next",
                      )
                    ],
                  ),
                  verticleSpace(20),
                ],
              ),
              itemCount: listOnboardingItemModel.length,
            ),
          );
        },
      ),
    );
  }
}
