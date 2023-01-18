import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/payment/book_now.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/textfield.dart';
import 'package:my_therapists/widgets/simple_button.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout', onTap: () => Get.back()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            //key: controller.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30.h),
                CustomTextfield(hint_Text: 'Name'),
                SizedBox(height: 15.h),
                CustomTextfield(hint_Text: 'Email Address'),
                SizedBox(height: 15.h),
                CustomTextfield(hint_Text: 'Phone Number'),
                SizedBox(height: 15.h),
                _proceedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SimpleButton _proceedButton() {
    return SimpleButton(
      button_color: AppColors.green,
      button_label: 'Proceed',
      onButtonPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Get.to(BookNowScreen(), transition: Transition.fade);
      },
    );
  }
}
