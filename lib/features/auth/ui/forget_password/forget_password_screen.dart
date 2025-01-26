

import '../../../../core/app_imports/app_import.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Forgot\npassword?",
              style: TextStyles.font24BlackColorBold.copyWith(
                fontSize: 36.sp,
                height: 1.1
              ),
            ),
          ),
          verticleSpace(20),
          CustomTextFormField(
            prefixIcon: Icon(
              Icons.person_2_sharp,
              size: 24.sp,
            ),
            hintText: "Username or Email",
            validator: (value) {},
          ),
          verticleSpace(20),
          Text(
            "* We will send you a message to set or reset your new password",
            style: TextStyles.font14GreyColorBold,
          ),
          verticleSpace(20),
          CustomMaterialButton(
              // loading: true,
              function: () {},
              text: "Submit"),
          verticleSpace(20),
        ]),
      ),
    );
  }
}
