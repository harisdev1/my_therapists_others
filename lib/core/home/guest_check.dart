// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/auth/login.dart';
import 'package:my_therapists/auth/signup.dart';
import 'package:my_therapists/core/user_agreement/privacy_policy.dart';
import 'package:my_therapists/core/user_agreement/terms_and_conditions.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/Exit_Confirmation.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import 'package:my_therapists/widgets/social_button.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/link_widget.dart';
import '../../../utils/app_strings.dart';
import '../../../widgets/center_logo.dart';

class GuestRegistrationScreen extends StatelessWidget {
  const GuestRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await showDialog(
        context: context,
        builder: (context) => exitConfirmationDialog(context),
      ),
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30.h),
                      _signInTOContinue(),
                      SizedBox(height: 30.h),
                      Row(
                        children: [
                          Expanded(child: _loginButton()),
                          SizedBox(width: 5.w),
                          Expanded(child: _signupButton()),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  SimpleButton _signupButton() {
    return SimpleButton(
      button_label: 'Signup',
      onButtonPressed: () {
        Get.to(SignupScreen(), transition: Transition.fade);
      },
    );
  }

  SimpleButton _loginButton() {
    return SimpleButton(
      button_color: AppColors.green,
      button_label: 'Login',
      onButtonPressed: () {
        Get.to(LoginScreen(), transition: Transition.fade);
      },
    );
  }

  CustomText _signInTOContinue() => CustomText(
        fontSize: 22,
        text: 'Sign in to continue',
        fontweight: FontWeight.w500,
      );
}
