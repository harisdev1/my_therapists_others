// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/profile/edit_profile.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/simple_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        onTap: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 72.r,
                        backgroundColor: AppColors.green,
                        child: CircleAvatar(
                          radius: 70.r,
                          backgroundImage: AssetImage(AssetPath.user),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                //------ Name----------
                _fieldLabel('Name', 'John Smith'),
                //------ Email ----------
                _fieldLabel('Email', 'info@example.com'),
                //------ DOB----------
                _fieldLabel('DOB', '10 / 25 / 2000'),
                //------ Address----------
                _fieldLabel('Address', 'House w32 california'),
                //------ Bio----------
                _fieldLabel('Bio',
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '),
                // SizedBox(height: 15.h),
                _editProfileButton(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SimpleButton _editProfileButton() {
    return SimpleButton(
      button_color: AppColors.green,
      button_label: 'Edit Profile',
      onButtonPressed: () {
        Get.to(EditProfileScreen(), transition: Transition.fade);
      },
    );
  }
}

Widget _fieldLabel(String labelText, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(text: labelText, fontSize: 12),
      SizedBox(height: 10.h),
      Container(
        width: double.infinity,
        color: AppColors.lightGrey2,
        child: Padding(
          padding: EdgeInsets.only(top: 17, bottom: 17, left: 18, right: 18),
          child: CustomText(text: value, fontSize: 12, color: AppColors.grey),
        ),
      ),
      SizedBox(height: 10.h),
    ],
  );
}
