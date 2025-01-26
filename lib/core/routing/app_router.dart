import 'package:final_project_amit62/core/routing/routes.dart';
import 'package:final_project_amit62/core/services/services_locator.dart';
import 'package:final_project_amit62/features/auth/logic/auth_cubit.dart';
import 'package:final_project_amit62/features/auth/ui/forget_password/forget_password_screen.dart';
import 'package:final_project_amit62/features/auth/ui/login/login_screen.dart';
import 'package:final_project_amit62/features/auth/ui/register/register_screen.dart';
import 'package:final_project_amit62/features/home/ui/home_screen.dart';
import 'package:final_project_amit62/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return pageRouteBuilder(screen: const OnBoardingScreen());
      case Routes.loginScreen:
        return pageRouteBuilder(
            screen: BlocProvider(
          create: (context) => AuthCubit(getIt()),
          child: LoginScreen(),
        ));
      case Routes.registerScreen:
        return pageRouteBuilder(
            screen: BlocProvider(
          create: (context) => AuthCubit(getIt())..setting(),
          child: const RegisterScreen(),
        ));
      case Routes.forgetPasswordScreen:
        return pageRouteBuilder(screen: const ForgetPasswordScreen());
      case Routes.homeScreen:
        return pageRouteBuilder(screen: HomeScreen());
    }
    return null;
  }

  static PageRouteBuilder pageRouteBuilder({required Widget screen}) {
    return PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation<double> animation, Animation<double> secondaryAnimation) {
      const begin = Offset(-1, 0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: screen);
    });
  }
}
