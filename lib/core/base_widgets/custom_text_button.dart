import 'package:final_project_amit62/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function function;
  final Color color;

  const CustomTextButton(
      {super.key,
      required this.title,
      required this.function,
      this.color = AppColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => function(),
        child: Text(
          title,
          style: TextStyle(
            color: color,
          ),
        ));
  }
}
