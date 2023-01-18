import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/auth/change_password.dart';
import 'package:my_therapists/auth/login.dart';
import 'package:my_therapists/auth/pre_login.dart';
import 'package:my_therapists/auth/signup.dart';
import 'package:my_therapists/core/1)masseur_module/home/masseur_bottom_navigation.dart';
import 'package:my_therapists/core/payment/card_details.dart';
import 'package:my_therapists/core/profile/profile.dart';
import 'package:my_therapists/core/user_agreement/privacy_policy.dart';
import 'package:my_therapists/core/user_agreement/terms_and_conditions.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/core/wallet/my_wallet.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/link_widget.dart';

class CustomGuestDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 0.7.sw,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 0.4.sh,
            child: _drawerHeader(),
          ),
          _drawerListTile(
            onTap: () => Get.back(),
            label: 'Home',
          ),
          _settingsDropDown(context),
        ],
      ),
    );
  }

  InkWell _drawerListTile({void Function()? onTap, required String label}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        width: double.infinity,
        child: CustomText(fontSize: 15, text: label),
      ),
    );
  }
}

Theme _settingsDropDown(BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
      backgroundColor: AppColors.green,
      initiallyExpanded: false,
      trailing: SizedBox(),
      title: CustomText(
        text: "Settings",
        fontSize: 15,
      ),
      textColor: AppColors.white,
      collapsedTextColor: AppColors.black,
      // childrenPadding: EdgeInsets.only(left: 20), //children padding
      children: [
        InkWell(
          onTap: () {
            Get.back();
            Get.to(TermsAndConditionsScreen());
          },
          child: Container(
            padding: EdgeInsets.only(left: 40, top: 10, bottom: 5),
            width: double.infinity,
            color: Colors.lightGreen,
            child: CustomText(fontSize: 15, text: 'Terms and Conditions'),
          ),
        ),
        InkWell(
          onTap: () {
            Get.back();
            Get.to(PrivacyPolicyScreen());
          },
          child: Container(
            padding: EdgeInsets.only(left: 40, top: 10, bottom: 5),
            width: double.infinity,
            color: Colors.lightGreen,
            child: CustomText(fontSize: 15, text: 'Privacy Policy'),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(left: 40, top: 10, bottom: 5),
            width: double.infinity,
            color: Colors.lightGreen,
            child: CustomText(fontSize: 15, text: 'Invite'),
          ),
        ),

        //more child menu
      ],
    ),
  );
}

DrawerHeader _drawerHeader() {
  return DrawerHeader(
    //decoration: BoxDecoration(color: Colors.blue),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Flexible(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.green,
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 48,
              backgroundImage: AssetImage(AssetPath.avatar),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        CustomText(
          text: "Guest User".toUpperCase(),
          fontSize: 20,
          fontweight: FontWeight.bold,
        ),
        SizedBox(height: 10.h),
        LinkWidget(
          text: "Create An Account",
          fontSize: 15,
          color: AppColors.grey,
          onButtonPressed: () {
            Get.offAll(SignupScreen());
          },
        ),
        SizedBox(height: 5.h),
        //   LinkWidget(
        //     text: "Login",
        //     fontSize: 15,
        //     color: AppColors.grey,
        //     onButtonPressed: () {
        //       Get.offAll(PreLoginScreen());
        //     },
        //   ),
      ],
    ),
  );
}
