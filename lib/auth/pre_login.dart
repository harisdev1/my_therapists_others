// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/auth/login.dart';
import 'package:my_therapists/core/user_agreement/privacy_policy.dart';
import 'package:my_therapists/core/user_agreement/terms_and_conditions.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/Exit_Confirmation.dart';
import 'package:my_therapists/widgets/social_button.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/link_widget.dart';
import '../../../utils/app_strings.dart';
import '../../../widgets/center_logo.dart';

class PreLoginScreen extends StatelessWidget {
  const PreLoginScreen({Key? key}) : super(key: key);

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
                    children: [
                      SizedBox(height: 120.h),
                      _logo(),
                      SizedBox(height: 30.h),
                      _preLoginLabel(),
                      SizedBox(height: 30.h),
                      _emailSocialButton(),
                      SizedBox(height: 7.h),
                      _googleSocialButton(),
                      SizedBox(height: 7.h),
                      _facebookSocialButton(),
                      SizedBox(height: 7.h),
                      if (Platform.isIOS) _appleSocialButton(),
                      Spacer(),
                      _termsAndprivacyNavigationWidget(context),
                      SizedBox(height: 7.h),
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

  Widget _termsAndprivacyNavigationWidget(BuildContext context) {
    TextStyle linkStyle = TextStyle(
      color: AppColors.green,
      decoration: TextDecoration.underline,
    );
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            color: AppColors.black,
          ),
          children: <TextSpan>[
            TextSpan(text: 'By  Sign in, you agree to our '),
            TextSpan(
                text: 'Terms &\n conditions',
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(TermsAndConditionsScreen(),
                        transition: Transition.fade);
                  }),
            TextSpan(text: ' and '),
            TextSpan(
                text: 'Privacy Policy',
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(PrivacyPolicyScreen(), transition: Transition.fade);
                  }),
          ],
        ),
      ),
    );
  }

  CenterLogo _logo() {
    return CenterLogo(
        isShadowContainer: true, logoWidth: 150.w, logoHeight: 150.w);
  }

  SocialButton _appleSocialButton() {
    return SocialButton(
      button_color: AppColors.blue,
      button_icon: Image.asset(
        AssetPath.apple,
        width: 20.w,
        height: 20.h,
      ),
      button_label: AppStrings.loginInWithApple,
      onButtonPressed: () {},
    );
  }

  SocialButton _facebookSocialButton() {
    return SocialButton(
      button_color: AppColors.blue,
      button_icon: Image.asset(
        AssetPath.facebook,
        width: 20.w,
        height: 20.h,
      ),
      button_label: AppStrings.loginInWithFacebook,
      onButtonPressed: () {},
    );
  }

  SocialButton _googleSocialButton() {
    return SocialButton(
      button_color: AppColors.red,
      button_icon: Image.asset(
        AssetPath.google,
        width: 20.w,
        height: 20.h,
      ),
      button_label: AppStrings.loginInWithGoogle,
      onButtonPressed: () {},
    );
  }

  SocialButton _emailSocialButton() {
    return SocialButton(
      button_color: AppColors.green,
      button_icon: Image.asset(
        AssetPath.email,
        width: 20.w,
        height: 20.h,
      ),
      button_label: AppStrings.loginInWithEmail,
      onButtonPressed: () {
        Get.to(LoginScreen(), transition: Transition.fade);
      },
    );
  }

  CustomText _preLoginLabel() => CustomText(
        fontSize: 22,
        text: AppStrings.preLogin,
        fontweight: FontWeight.w500,
      );
}

Widget _termsAndCondtionsLinkWidget() {
  TextStyle defaultStyle =
      const TextStyle(color: AppColors.black, fontSize: 25.0);
  TextStyle linkStyle = const TextStyle(color: AppColors.green, fontSize: 25);
  return RichText(
    text: TextSpan(
      style: defaultStyle,
      children: <TextSpan>[
        const TextSpan(text: 'By signin, you agree to our'),
        TextSpan(
            text: 'Terms of Service',
            style: linkStyle,
            recognizer: TapGestureRecognizer()..onTap = () {}),
        const TextSpan(text: 'and'),
        TextSpan(
            text: 'Privacy Policy',
            style: linkStyle,
            recognizer: TapGestureRecognizer()..onTap = () {}),
      ],
    ),
  );
}
