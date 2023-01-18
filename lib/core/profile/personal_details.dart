// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/profile/select_options.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/widgets/center_logo.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_dropdown.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/textfield.dart';
import 'package:my_therapists/widgets/simple_button.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Personal Details',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(radius: 50),
                     Icon(
                      Icons.camera_alt_sharp,
                      color: AppColors.white,
                    ),
                  ],
                ),
                SizedBox(height: 28.h),
             
                CustomTextfield(hint_Text: AppStrings.fullName),
                SizedBox(height: 15.h),
                _customDropDown(),
                SizedBox(height: 15.h),
                CustomTextfield(hint_Text: AppStrings.phoneNumber),
                SizedBox(height: 15.h),
                CustomTextfield(hint_Text: AppStrings.address),
                SizedBox(height: 15.h),
                CustomTextfield(hint_Text: AppStrings.skills),
                SizedBox(height: 15.h),
                CustomTextfield(hint_Text: AppStrings.experience),
                SizedBox(height: 15.h),
                CustomTextfield(
                  hint_Text: AppStrings.bio,
                  textFieldHeight: 107.h,
                  fieldType: TextInputType.multiline,
                  maxLines: 4,
                ),
                SizedBox(height: 15.h),
                SimpleButton(
                  button_color: AppColors.green,
                  button_label: 'Save',
                  onButtonPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Get.to(SelectOptionsScreen(), transition: Transition.fade);
                  },
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _customDropDown() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: AppColors.green),
        ),
        height: 50.h,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 3.0, left: 10.0),
        child: DropDown(),
      ),
    ],
  );
}
