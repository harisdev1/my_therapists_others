import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/1)masseur_module/home/masseur_bottom_navigation.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/widgets/center_logo.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/textfield.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import 'package:my_therapists/utils/field_validators.dart';
import 'package:my_therapists/widgets/toast.dart';

class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController _existingPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _changePasswordFormKey = GlobalKey<FormState>();
  ChangePasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Change Password',
        onTap: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            key: _changePasswordFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),
                _existingPasswordTextField(),
                SizedBox(height: 15.h),
                _newPasswordTextField(),
                SizedBox(height: 15.h),
                _confirmNewPasswordTextField(),
                SizedBox(height: 15.h),
                _changeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SimpleButton _changeButton() {
    return SimpleButton(
      button_color: AppColors.green,
      button_label: 'Change',
      onButtonPressed: () {
        _changePasswordValidationMethod();
      },
    );
  }

  void _changePasswordValidationMethod() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_changePasswordFormKey.currentState!.validate()) {
      Get.offAll(MasseurNavigationScreen(), transition: Transition.fade);
      CustomToast.showToast(message: 'Password Updated');
    }
  }

  CustomTextfield _existingPasswordTextField() {
    return CustomTextfield(
      textController: _existingPasswordController,
      fieldValidator: (value) => value?.validatePassword,
      hint_Text: 'Existing Password',
    );
  }

  CustomTextfield _newPasswordTextField() {
    return CustomTextfield(
      textController: _newPasswordController,
      fieldValidator: (value) => value?.validatePassword,
      hint_Text: 'New password',
    );
  }

  CustomTextfield _confirmNewPasswordTextField() {
    return CustomTextfield(
      textController: _confirmPasswordController,
      fieldValidator: _confirmPasswordValidator,
    );
  }

  String? _confirmPasswordValidator(value) {
    if (value != _confirmPasswordController.text) {
      return 'pasword Not match';
    } else if (value!.isEmpty) {
      return 'Field can\'t be empty';
    } else {
      return null;
    }
  }

  CustomText _frogetPasswordLabel() =>
      CustomText(fontSize: 22, text: AppStrings.forgetPassword);

  CenterLogo _logo() {
    return CenterLogo(
      isShadowContainer: true,
      logoWidth: 150.w,
      logoHeight: 150.w,
    );
  }
}
