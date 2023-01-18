import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomText extends StatelessWidget {
  final double fontSize;
  final String text;
  final Color? color;
  final String? fontFamily;
  final bool? isUnderline;
  final FontWeight? fontweight;
  final TextAlign? textAlign;
  CustomText(
      {super.key,
      this.textAlign,
      required this.fontSize,
      required this.text,
      this.color,
      this.fontweight,
      this.fontFamily,
      this.isUnderline = false});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.justify,
      style: TextStyle(
        color: color ?? AppColors.black,
        // fontFamily: fontFamily ?? 'MyLove',
        fontSize: fontSize,
        fontWeight: fontweight ?? FontWeight.normal,
        decoration: (isUnderline == true)
            ? TextDecoration.underline
            : TextDecoration.none,
      ),
    );
  }
}
