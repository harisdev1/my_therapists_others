// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/1)masseur_module/home/masseur_bottom_navigation.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/widgets/center_logo.dart';
import 'package:my_therapists/widgets/custom_dropdown.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/textfield.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import 'package:my_therapists/utils/field_validators.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({Key? key}) : super(key: key);
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  final _completeProfileformKey = GlobalKey<FormState>();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            key: _completeProfileformKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),
                CenterLogo(logoWidth: 150.w, logoHeight: 150.w),
                SizedBox(height: 28.h),
                _completeProfileLabel(),
                SizedBox(height: 30.h),
                CustomTextfield(
                  hint_Text: AppStrings.fullName,
                  textController: _fullNameController,
                  fieldValidator: (value) => value?.validateEmpty,
                ),
                SizedBox(height: 15.h),
                _customDropDown(),
                SizedBox(height: 15.h),
                CustomTextfield(
                  hint_Text: AppStrings.phoneNumber,
                  textController: _phoneNumberController,
                  fieldValidator: (value) => value?.validateEmpty,
                ),
                SizedBox(height: 15.h),
                CustomTextfield(
                  hint_Text: AppStrings.address,
                  textController: _addressController,
                  fieldValidator: (value) => value?.validateEmpty,
                ),
                SizedBox(height: 15.h),
                CustomTextfield(
                  hint_Text: AppStrings.skills,
                  textController: _skillsController,
                  fieldValidator: (value) => value?.validateEmpty,
                ),
                SizedBox(height: 15.h),
                CustomTextfield(
                  hint_Text: AppStrings.experience,
                  textController: _experienceController,
                  fieldValidator: (value) => value?.validateEmpty,
                ),
                SizedBox(height: 15.h),
                CustomTextfield(
                  hint_Text: AppStrings.bio,
                  textFieldHeight: 107.h,
                  fieldType: TextInputType.multiline,
                  maxLines: 4,
                ),
                SizedBox(height: 15.h),
                _doneButton(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomText _completeProfileLabel() => CustomText(
      fontSize: 22,
      fontweight: FontWeight.w500,
      text: AppStrings.completeProfile);

  SimpleButton _doneButton() {
    return SimpleButton(
      button_color: AppColors.green,
      button_label: AppStrings.done,
      onButtonPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_completeProfileformKey.currentState!.validate()) {
          Get.off(MasseurNavigationScreen(isMasseur: true),
              transition: Transition.fadeIn);
        }
      },
    );
  }
}

Widget _customDropDown() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      border: Border.all(color: AppColors.green),
    ),
    height: 50.h,
    child: DropDown(),
  );
}
