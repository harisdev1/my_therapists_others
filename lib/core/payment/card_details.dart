// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/1)masseur_module/home/masseur_bottom_navigation.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/textfield.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import 'package:my_therapists/widgets/toast.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Card Details',
        onTap: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              _cardNumberTextField(),
              SizedBox(height: 10.h),
              Row(
                children: [
                  _expiryMonthTextField(),
                  SizedBox(width: 10.w),
                  _expiryYearTextField(),
                ],
              ),
              SizedBox(height: 15.h),
              _cvvTextField(),
              SizedBox(height: 15.h),
              _addNewButton(),
              SizedBox(height: 10.h),
              _cardListTileWidget(
                leadingIconPath: AssetPath.jcb,
              ),
              SizedBox(height: 10.h),
              _cardListTileWidget(
                leadingIconPath: AssetPath.visa,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SimpleButton _addNewButton() {
    return SimpleButton(
        button_label: 'Add New',
        button_color: AppColors.green,
        onButtonPressed: () {
          Get.offAll(MasseurNavigationScreen(), transition: Transition.fade);
          CustomToast.showToast(message: 'Card Added');
        });
  }

  Widget _cardListTileWidget({required String leadingIconPath}) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Container(
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                leadingIconPath,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: CustomText(
          fontSize: 25,
          color: AppColors.grey,
          text: '**** **** ****',
        ),
      ),
    );
  }

  CustomTextfield _cvvTextField() {
    return CustomTextfield(
      prefix: Icon(Icons.lock),
      hint_Text: 'CVV',
    );
  }

  Expanded _expiryYearTextField() {
    return Expanded(
      child: CustomTextfield(
        prefix: Icon(Icons.calendar_month),
        hint_Text: 'Exp Year',
      ),
    );
  }

  Expanded _expiryMonthTextField() {
    return Expanded(
      child: CustomTextfield(
        prefix: Icon(Icons.calendar_month),
        hint_Text: 'Exp Month',
      ),
    );
  }

  CustomTextfield _cardNumberTextField() {
    return CustomTextfield(
      prefix: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        width: 30,
        height: 20,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetPath.jcb,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      hint_Text: 'Card Number',
      fieldType: TextInputType.number,
    );
  }
}
