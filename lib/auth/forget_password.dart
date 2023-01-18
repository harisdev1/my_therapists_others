import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/auth/verify_otp.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/utils/field_validators.dart';
import 'package:my_therapists/widgets/center_logo.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/textfield.dart';
import 'package:my_therapists/widgets/flushbar.dart';
import 'package:my_therapists/widgets/simple_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailAddressController = TextEditingController();
  final _forgetPasswordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            key: _forgetPasswordFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),
                _logo(),
                SizedBox(height: 30.h),
                _forgetPasswordLabel(),
                SizedBox(height: 30.h),
                _emailTextField(),
                SizedBox(height: 15.h),
                _resetButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SimpleButton _resetButton() {
    return SimpleButton(
      button_color: AppColors.green,
      button_label: AppStrings.reset,
      onButtonPressed: () {
        _forgetPasswordValidationMethod();
      },
    );
  }

  /// ------------------  Form Validation Method -------------
  void _forgetPasswordValidationMethod() {
    FocusScope.of(context).unfocus();
    if (_forgetPasswordFormKey.currentState!.validate()) {
      Get.offAll(VerifyOtpScreen(false), transition: Transition.fade);
    }
  }

  CustomTextfield _emailTextField() {
    return CustomTextfield(
      hint_Text: AppStrings.email,
      textController: _emailAddressController,
      fieldValidator: (value) => value?.validateEmail,
    );
  }

  CustomText _forgetPasswordLabel() => CustomText(
      fontSize: 22,
      fontweight: FontWeight.w500,
      text: AppStrings.forgetPassword);

  CenterLogo _logo() {
    return CenterLogo(
      isShadowContainer: true,
      logoWidth: 150.w,
      logoHeight: 150.w,
    );
  }
}
