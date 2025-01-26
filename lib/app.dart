import 'core/app_imports/app_import.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.whiteColor,
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // initialRoute: SharedprefHelper.getData(key: "token") == null
          //     ? Routes.loginScreen
          //     : Routes.homeScreen,
          initialRoute: SharedprefHelper.getData(key: "onboarding") == true
              ? SharedprefHelper.getData(key: "token") == null
                  ? Routes.loginScreen
                  : Routes.homeScreen
              : Routes.onBoardingScreen,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
