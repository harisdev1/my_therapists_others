import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PincodeTheme {
  PincodeTheme._();
  static PinTheme pinCodeFieldTheme = PinTheme(
      inactiveFillColor: AppColors.dimWhite,
      selectedFillColor: AppColors.dimWhite,
      selectedColor: AppColors.grey,
      inactiveColor: AppColors.grey,
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(10),
      fieldHeight: 50.h,
      fieldWidth: 49.w,
      activeFillColor: Colors.white,
      fieldOuterPadding: EdgeInsets.only(bottom: 10));
}
