import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/notifications_switch.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import '../../utils/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30.h),
                SimpleButton(
                  isCenterLabel: false,
                  isBoxShadow: true,
                  label_color: AppColors.green,
                  button_color: AppColors.white,
                  button_label: 'Card Details',
                  onButtonPressed: () {},
                ),
                SizedBox(height: 15.h),
                PushNotificationButton(),
                SizedBox(height: 15.h),
                SimpleButton(
                  isCenterLabel: false,
                  isBoxShadow: true,
                  label_color: AppColors.green,
                  button_color: AppColors.white,
                  button_label: 'Card Details',
                  onButtonPressed: () {
                  },
                ),
                SizedBox(height: 15.h),
                SimpleButton(
                  isCenterLabel: false,
                  isBoxShadow: true,
                  label_color: AppColors.green,
                  button_color: AppColors.white,
                  button_label: 'Card Details',
                  onButtonPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
