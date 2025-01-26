import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSocialMediaItem extends StatelessWidget {
  final String icon;
  final Function function;
  final bool isSvg;

  const CustomSocialMediaItem(
      {super.key,
      required this.icon,
      this.isSvg = true,
      required this.function});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: isSvg ? SvgPicture.asset(icon) : Image.asset(icon),
    );
  }
}
