import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/auth/login.dart';
import 'package:my_therapists/auth/verify_otp.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/widgets/center_logo.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/textfield.dart';
import 'package:my_therapists/widgets/link_widget.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import 'package:my_therapists/utils/field_validators.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _signupformKey = GlobalKey<FormState>();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () => Get.back(),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: _signupformKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30.h),
                      _logo(),
                      SizedBox(height: 12.h),
                      _signupLabel(),
                      SizedBox(height: 29.h),
                      _fullNameTextField(),
                      SizedBox(height: 15.h),
                      _emailTextField(),
                      SizedBox(height: 15.h),
                      _phoneNumberTextField(),
                      SizedBox(height: 15.h),
                      _passwordTextField(),
                      SizedBox(height: 15.h),
                      _confirmPasswordTextField(),
                      SizedBox(height: 13.h),
                      _signupButton(),
                      SizedBox(height: 13.h),
                      Spacer(),
                      _loginNavigationWidget(context),
                      SizedBox(height: 7.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  CustomTextfield _fullNameTextField() {
    return CustomTextfield(
      hint_Text: AppStrings.fullName,
      textController: _fullNameController,
      fieldValidator: (value) => value?.validateEmpty,
    );
  }

  CustomTextfield _emailTextField() {
    return CustomTextfield(
      hint_Text: AppStrings.email,
      textController: _emailAddressController,
      fieldValidator: (value) => value?.validateEmail,
    );
  }

  CustomTextfield _phoneNumberTextField() {
    return CustomTextfield(
      hint_Text: AppStrings.phoneNumber,
      textController: _phoneNumberController,
      fieldValidator: (value) => value?.validatePhonNumber,
    );
  }

  CustomTextfield _passwordTextField() {
    return CustomTextfield(
      isSuffixIcon: true,
      isPasswordField: true,
      hint_Text: AppStrings.password,
      textController: _passwordController,
      fieldValidator: (value) => value?.validatePassword,
    );
  }

  CustomTextfield _confirmPasswordTextField() {
    return CustomTextfield(
      isSuffixIcon: true,
      isPasswordField: true,
      hint_Text: AppStrings.confirmPassword,
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

  SimpleButton _signupButton() {
    return SimpleButton(
      button_color: AppColors.green,
      button_label: AppStrings.signup,
      onButtonPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_signupformKey.currentState!.validate()) {
          Get.off(VerifyOtpScreen(true), transition: Transition.fade);
        }
      },
    );
  }

  void _setCredentials() {
    _fullNameController.text = 'User';
    _emailAddressController.text = 'user@gmail.com';
    _phoneNumberController.text = '10202020202';
    _passwordController.text = '1234@A24';
    _confirmPasswordController.text = '1234@A24';
  }

  CustomText _signupLabel() => CustomText(
      fontSize: 22, fontweight: FontWeight.w500, text: AppStrings.sign_up);

  Widget _logo() {
    return GestureDetector(
      onTap: () {
        _setCredentials();
      },
      child: CenterLogo(
        isShadowContainer: true,
        logoWidth: 150.w,
        logoHeight: 150.w,
      ),
    );
  }

  Widget _loginNavigationWidget(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(fontSize: 13, text: 'Already Have an account?'),
          LinkWidget(
              fontSize: 18,
              color: AppColors.green,
              isUnderLine: true,
              text: 'Login Now',
              onButtonPressed: () {
                Get.to(LoginScreen());
              })
        ],
      ),
    );
  }
}
