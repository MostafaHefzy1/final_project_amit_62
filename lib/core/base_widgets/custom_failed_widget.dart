import 'package:final_project_amit62/core/app_imports/app_import.dart';
import 'package:final_project_amit62/core/helper/spacing.dart';
import 'package:final_project_amit62/core/networking/error_model.dart';
import 'package:final_project_amit62/core/theming/styles.dart';

class CustomFailedWidget extends StatelessWidget {
  final String message;

  const CustomFailedWidget({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        children: [
          verticleSpace(5),
          Text(
            message,
            style: TextStyles.font14RedColorColorBold.copyWith(fontSize: 18.sp),
          ),
        ],
      ),
    );
  }
}
