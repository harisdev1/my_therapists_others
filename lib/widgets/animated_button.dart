// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CustomAnimatedButton extends StatelessWidget {
  String button_label;
  Color? button_color;
  double? buttonWidth;
  double? labelFontSize;
  bool isCenterLabel;
  Color? label_color;
  bool isBoxShadow;
  Function()? onButtonPressed;
  RoundedLoadingButtonController controller;
  // ignore: use_key_in_widget_constructors, non_constant_identifier_names
  CustomAnimatedButton(
      {this.label_color = Colors.white,
      this.isBoxShadow = false,
      this.isCenterLabel = true,
      this.button_color = AppColors.green,
      this.labelFontSize,
      required this.button_label,
      required this.controller,
      this.buttonWidth,
      required this.onButtonPressed});

  // final RoundedLoadingButtonController _btnController =
  //     RoundedLoadingButtonController();

  // void _doSomething() async {
  //   Timer(Duration(seconds: 3), () {
  //     _btnController.success();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return RoundedLoadingButton(
      width: buttonWidth ?? deviceWidth,
      height: 50.h,
      color: button_color,
      controller: controller,
      onPressed: onButtonPressed,
      child: Container(
        width: buttonWidth ?? deviceWidth,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: isBoxShadow ? _boxShadowList() : null,
          color: button_color,
        ),
        child: Row(
          mainAxisAlignment: isCenterLabel
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            if (isCenterLabel == false) SizedBox(width: 10),
            Text(
              button_label,
              style: TextStyle(
                color: label_color,
                // fontFamily: 'MyLove',
                fontSize: labelFontSize ?? 17.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<BoxShadow>? _boxShadowList() {
  return [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
    ),
  ];
}
