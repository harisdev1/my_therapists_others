import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/auth/forget_password.dart';
import 'package:my_therapists/auth/select_options.dart';
import 'package:my_therapists/auth/signup.dart';
import 'package:my_therapists/core/1)masseur_module/home/masseur_bottom_navigation.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/utils/field_validators.dart';
import 'package:my_therapists/utils/shared_preferences.dart';
import 'package:my_therapists/widgets/center_logo.dart';
import 'package:my_therapists/widgets/animated_button.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/textfield.dart';
import 'package:my_therapists/widgets/flushbar.dart';
import 'package:my_therapists/widgets/link_widget.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final loginformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: (() => Get.back()),
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
                  key: loginformKey,
                  child: Column(
                    children: [
                      SizedBox(height: 45.h),
                      _logo(),
                      SizedBox(height: 30.h),
                      _loginLabel(),
                      SizedBox(height: 30.h),
                      _emailTextField(),
                      SizedBox(height: 15.h),
                      _passwordTextField(),
                      SizedBox(height: 13.h),
                      _loginButton(),
                      SizedBox(height: 7.h),
                      _forgetPasswordLink(),
                      SizedBox(height: 7.h),
                      Spacer(),
                      _signupNavigationWidget(),
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

  Widget _signupNavigationWidget() {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(fontSize: 13, text: 'Don\'t Have an account?'),
          LinkWidget(
              color: AppColors.green,
              isUnderLine: true,
              fontSize: 18,
              text: 'signup',
              onButtonPressed: () {
                Get.to(SignupScreen());
              })
        ],
      ),
    );
  }

  /// ------------------ Login Form Validation Method -------------
  void _loginValidationMethod() async {
    FocusScope.of(context).unfocus();
    if (loginformKey.currentState!.validate()) {
      // Get.offAll( UserNavigationScreen(isMasseur: true),
      //     transition: Transition.fade);
      Get.off(SelectOptionsScreen());

      SharedPrefs.instance.setBool('guest', false);
    }
  }

  LinkWidget _signupLink() {
    return LinkWidget(
      color: AppColors.green,
      text: AppStrings.signup,
      isUnderLine: true,
      onButtonPressed: () {
        Get.to(SignupScreen());
      },
    );
  }

  LinkWidget _forgetPasswordLink() {
    return LinkWidget(
      color: AppColors.green,
      text: "${AppStrings.forgetPassword}?",
      isUnderLine: true,
      onButtonPressed: () {
        Get.to(ForgetPasswordScreen());
      },
    );
  }

  SimpleButton _loginButton() {
    return SimpleButton(
      button_color: AppColors.green,
      button_label: AppStrings.signIn,
      onButtonPressed: () {
        _loginValidationMethod();
      },
    );
  }

  CustomTextfield _emailTextField() {
    return CustomTextfield(
      textController: _emailAddressController,
      hint_Text: AppStrings.email,
      fieldValidator: (value) => value?.validateEmail,
    );
  }

  CustomTextfield _passwordTextField() {
    return CustomTextfield(
      textController: _passwordController,
      isSuffixIcon: true,
      isPasswordField: true,
      hint_Text: AppStrings.password,
      fieldValidator: (value) => value?.validatePassword,
    );
  }

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

  void _setCredentials() {
    _emailAddressController.text = 'user@gmail.com';
    _passwordController.text = '1234@A24';
  }

  CustomText _loginLabel() => CustomText(
        fontSize: 22,
        text: AppStrings.login,
        fontweight: FontWeight.w500,
      );
}
