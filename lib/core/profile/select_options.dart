import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/1)masseur_module/home/home_masseur.dart';
import 'package:my_therapists/auth/forget_password.dart';
import 'package:my_therapists/auth/signup.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/widgets/center_logo.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/simple_button.dart';

class SelectOptionsScreen extends StatelessWidget {
  const SelectOptionsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            //key: controller.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),
                CenterLogo(
                  logoWidth: 150.w,
                  logoHeight: 150.w,
                ),
                SizedBox(height: 28.h),
                CustomText(fontSize: 22, text: AppStrings.selectOptions),
                SizedBox(height: 31.h),
                SimpleButton(
                  label_color: AppColors.green,
                  isBoxShadow: true,
                  button_color: AppColors.white,
                  button_label: AppStrings.boothOwner,
                  onButtonPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Get.to(MasseurHomeScreen());
                  },
                ),
                SizedBox(height: 20.h),
                SimpleButton(
                  isBoxShadow: true,
                  label_color: AppColors.green,
                  button_color: AppColors.white,
                  button_label: AppStrings.masseur,
                  onButtonPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    //  controller.checkLogin();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
