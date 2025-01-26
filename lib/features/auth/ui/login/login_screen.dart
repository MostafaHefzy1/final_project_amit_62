import '../../../../core/app_imports/app_import.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState && state.responseModel.status == false) {
          MyHelper.toast(
              message: state.responseModel.message!, status: ToastStatus.error);
        }

        if (state is LoginSuccessState && state.responseModel.status == true) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeScreen, (_) => false);
        }
      },
      builder: (context, state) {
        var cubit = context.read<AuthCubit>();
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "Welcome\nBack!",
                      style: TextStyles.font24BlackColorBold.copyWith(
                        fontSize: 36.sp,
                      ),
                    ),
                  ),
                  verticleSpace(20),
                  CustomTextFormField(
                    controller: _emailController,
                    prefixIcon: Icon(
                      Icons.person_2_sharp,
                      size: 24.sp,
                    ),
                    hintText: "Username or Email",
                    validator: (value) {},
                  ),
                  verticleSpace(10),
                  CustomTextFormField(
                    controller: _passwordController,
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 24.sp,
                    ),
                    hintText: "Password",
                    validator: (value) {},
                  ),
                  // verticleSpace(20),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: CustomTextButton(
                          title: "Forgot Password?",
                          function: () {
                            Navigator.pushNamed(
                                context, Routes.forgetPasswordScreen);
                          })),

                  verticleSpace(20),
                  CustomMaterialButton(
                      loading: state is LoginLoadingState,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          cubit.login(LoginRequestBody(
                              email: _emailController.text,
                              password: _passwordController.text));
                        }
                      },
                      text: "Login"),
                  verticleSpace(20),

                  Text(
                    "- OR Continue with -",
                    style: TextStyles.font14GreyColorBold,
                  ),

                  verticleSpace(20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSocialMediaItem(
                        function: () {
                          MyHelper.toast(
                              message: "message", status: ToastStatus.error);
                        },
                        icon: Assets.icons.googleIcon.path,
                        isSvg: false,
                      ),
                      horziontalSpace(10),
                      CustomSocialMediaItem(
                        function: () {},
                        icon: Assets.icons.appleIcon,
                      ),
                      horziontalSpace(10),
                      CustomSocialMediaItem(
                        function: () {},
                        icon: Assets.icons.facebookIcon,
                      ),
                    ],
                  ),
                  verticleSpace(20),

                  Text.rich(TextSpan(
                      text: "Create An Account  ",
                      style: TextStyles.font14GreyColorBold,
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style:
                              TextStyles.font14PrimaryColorColorBold.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, Routes.registerScreen);
                              print('Text clicked!');
                            },
                        )
                      ]))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
