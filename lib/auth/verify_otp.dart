// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/auth/reset_password.dart';
import 'package:my_therapists/core/profile/complete_profile.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/utils/themes/pincode_theme.dart';
import 'package:my_therapists/widgets/center_logo.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import '../utils/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatelessWidget {
  final bool flag;

  VerifyOtpScreen(this.flag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: (() => Get.back()),
      ),
      body: _verifyOtpForm(context),
    );
  }

  Widget _verifyOtpForm(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // key: VerifyOtpController.i.verifyOtpFormKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              _logo(),
              SizedBox(height: 28.h),
              _verificationLabel(),
              SizedBox(height: 30.h),
              _verificationInstructionText(),
              SizedBox(height: 22.h),
              _pinCodeField(context),
              SizedBox(height: 45.h),
              _clockImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pinCodeField(BuildContext context) => PinCodeTextField(
        textStyle: TextStyle(color: AppColors.green),
        appContext: context,
        autoDisposeControllers: false,
        pastedTextStyle: TextStyle(
          color: AppColors.green,
          fontWeight: FontWeight.bold,
        ),
        length: 6,
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        errorTextMargin: EdgeInsets.only(top: 4),
        validator: (value) {
          if (value!.length < 6) {
            return "Enter 6 gitis code ";
          } else {
            return null;
          }
        },
        pinTheme: PincodeTheme.pinCodeFieldTheme,
        cursorColor: AppColors.black,
        //controller: VerifyOtpController.i.otpController,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        // controller: textEditingController,
        keyboardType: TextInputType.number,
        boxShadows: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        onCompleted: (v) {
          print(flag);
          flag
              ? Get.offAll(CompleteProfileScreen())
              : Get.offAll(ResetPasswordScreen());
        },
        onTap: () => debugPrint("Pressed"),
        onChanged: (value) => debugPrint(value),
        beforeTextPaste: (text) {
          debugPrint("Allowing to paste $text");
          return true;
        },
      );

  Image _clockImage() =>
      Image.asset(AssetPath.clock, width: 74.w, height: 74.h);

  CustomText _verificationInstructionText() {
    return CustomText(
      fontSize: 14,
      text: AppStrings.verificationInstructions,
      color: AppColors.lightGrey,
    );
  }

  CustomText _verificationLabel() => CustomText(
        fontSize: 22,
        text: AppStrings.verification,
        fontweight: FontWeight.w500,
      );

  CenterLogo _logo() {
    return CenterLogo(
      isShadowContainer: true,
      logoWidth: 150.w,
      logoHeight: 150.w,
    );
  }
}
