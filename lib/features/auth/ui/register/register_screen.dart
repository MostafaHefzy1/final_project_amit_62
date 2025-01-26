


import '../../../../core/app_imports/app_import.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState &&
            state.responseModel.status == false) {
          MyHelper.toast(
              message: state.responseModel.message!, status: ToastStatus.error);
        }
        if (state is RegisterSuccessState && state.responseModel.status == true) {
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
                      "Create an \naccount",
                      style: TextStyles.font24BlackColorBold.copyWith(
                        fontSize: 36.sp,
                      ),
                    ),
                  ),
                  verticleSpace(10),
                  CustomTextFormField(
                    controller: _nameController,
                    prefixIcon: Icon(
                      Icons.person_2_sharp,
                      size: 24.sp,
                    ),
                    hintText: "Name",
                    validator: (value) {},
                  ),
                  verticleSpace(10),
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
                    controller: _phoneController,
                    prefixIcon: Icon(
                      Icons.phone_android_rounded,
                      size: 24.sp,
                    ),
                    wantDigitOnly: true,
                    hintText: "Phone",
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
                  verticleSpace(20),
                  Text.rich(TextSpan(
                      text: "By clicking the  ",
                      style: TextStyles.font14GreyColorBold,
                      children: [
                        TextSpan(
                          text: "Terms",
                          style: TextStyles.font14PrimaryColorColorBold,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              customBottomSheet(
                                  context: context,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      cubit.termsAndPrivacyModel?.data?.terms ??
                                          "",
                                      style: TextStyles.font16BlackColorMeduim,
                                    ),
                                  ));
                            },
                        ),
                        TextSpan(
                          text: "  Privacy",
                          style: TextStyles.font14PrimaryColorColorBold
                              .copyWith(color: AppColors.darkBlueColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              customBottomSheet(
                                  context: context,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      cubit.termsAndPrivacyModel?.data?.about ??
                                          "",
                                      style: TextStyles.font16BlackColorMeduim,
                                    ),
                                  ));
                            },
                        ),
                        TextSpan(
                          text: "  button, you agree to the public offer",
                          style: TextStyles.font14GreyColorBold,
                        )
                      ])),
                  verticleSpace(20),
                  CustomMaterialButton(
                      loading: state is RegisterLoadingState,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          cubit.register(RegisterRequestBody(
                              email: _emailController.text,
                              password: _passwordController.text,
                              phone: _phoneController.text,
                              name: _nameController.text));
                        }
                      },
                      text: "Create Account"),
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
                      text: "I Already Have an Account  ",
                      style: TextStyles.font14GreyColorBold,
                      children: [
                        TextSpan(
                          text: "Logn In",
                          style:
                              TextStyles.font14PrimaryColorColorBold.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
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
