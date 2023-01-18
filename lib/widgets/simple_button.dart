import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleButton extends StatelessWidget {
  // ignore: non_constant_identifier_names
  // ignore: non_constant_identifier_names
  String button_label;
  Color? button_color;
  double? buttonWidth;
  double? labelFontSize;
  bool isCenterLabel;
  Color? label_color;
  bool isBoxShadow;
  Function()? onButtonPressed;
  // ignore: use_key_in_widget_constructors, non_constant_identifier_names
  SimpleButton(
      {this.label_color = Colors.white,
      this.isBoxShadow = false,
      this.isCenterLabel = true,
      this.button_color = Colors.red,
      this.labelFontSize,
      required this.button_label,
      this.buttonWidth,
      required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Entry.all(
      duration: const Duration(milliseconds: 800),
      child: GestureDetector(
        onTap: onButtonPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
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
