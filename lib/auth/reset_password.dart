import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/auth/login.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/widgets/center_logo.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/textfield.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import 'package:my_therapists/utils/field_validators.dart';
import 'package:my_therapists/widgets/toast.dart';

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _resetPasswordFormKey = GlobalKey<FormState>();
  ResetPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            key: _resetPasswordFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),
                _logo(),
                SizedBox(height: 30.h),
                _resetPasswordLabel(),
                SizedBox(height: 30.h),
                _newPasswordTextField(),
                SizedBox(height: 15.h),
                _confirmPasswordTextField(),
                SizedBox(height: 15.h),
                _resetPasswordButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomTextfield _newPasswordTextField() {
    return CustomTextfield(
      textController: _newPasswordController,
      fieldValidator: (value) => value?.validatePassword,
      hint_Text: AppStrings.enterNewPassword,
      isPasswordField: true,
    );
  }

  SimpleButton _resetPasswordButton() {
    return SimpleButton(
      button_color: AppColors.green,
      button_label: AppStrings.resetPassword,
      onButtonPressed: () {
        _forgetPasswordValidationMethod();
      },
    );
  }

  /// ------------------  Form Validation Method -------------
  void _forgetPasswordValidationMethod() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_resetPasswordFormKey.currentState!.validate()) {
     
      Get.offAll(LoginScreen(), transition: Transition.fade);
       CustomToast.showToast(message: 'Password Reset Successfully');
    }
  }

  CustomTextfield _confirmPasswordTextField() {
    return CustomTextfield(
      textController: _confirmPasswordController,
      hint_Text: AppStrings.confirmPassword,
      fieldValidator: (value) =>
          (value != _newPasswordController.text) ? 'Password not match' : null,
      isPasswordField: true,
    );
  }

  CustomText _resetPasswordLabel() => CustomText(
      fontSize: 22,
      fontweight: FontWeight.w500,
      text: AppStrings.resetPassword);

  CenterLogo _logo() {
    return CenterLogo(
      isShadowContainer: true,
      logoWidth: 150.w,
      logoHeight: 150.w,
    );
  }
}
