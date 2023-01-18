import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/auth/change_password.dart';
import 'package:my_therapists/auth/pre_login.dart';
import 'package:my_therapists/core/1)masseur_module/home/masseur_bottom_navigation.dart';
import 'package:my_therapists/core/payment/card_details.dart';
import 'package:my_therapists/core/profile/profile.dart';
import 'package:my_therapists/core/user_agreement/privacy_policy.dart';
import 'package:my_therapists/core/user_agreement/terms_and_conditions.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/core/wallet/my_wallet.dart';
import 'package:my_therapists/utils/shared_preferences.dart';
import 'package:my_therapists/widgets/center_logo.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CustomUserDrawer extends StatelessWidget {
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
          if (true) ...[
            _pushNotificationListTile(),
            Divider(height: 0),
            _drawerListTile(
                onTap: () {
                  Get.back();
                  Get.to(MyWalletScreen());
                },
                label: 'Wallet'),
            Divider(height: 0),
            _drawerListTile(
                onTap: () async {
                  await SharedPrefs.instance.setBool('guest', true);
                  _logoutConfirmationDialog(context).show();
                },
                label: 'Logout'),
            Divider(height: 0),
          ],
        ],
      ),
    );
  }

  AwesomeDialog _logoutConfirmationDialog(BuildContext context) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      customHeader: CenterLogo(logoWidth: 50, logoHeight: 50),
      headerAnimationLoop: false,
      animType: AnimType.scale,
      title: 'Logout',
      showCloseIcon: true,
      descTextStyle: TextStyle(fontSize: 15),
      desc: 'Are u sure , you want to logout',
      buttonsTextStyle: const TextStyle(color: Colors.white),
      btnOkText: 'Logout',
      btnCancelText: 'Cancel',
      buttonsBorderRadius: BorderRadius.circular(5),
      btnOkColor: AppColors.red,
      bodyHeaderDistance: 5,
      btnCancelColor: AppColors.grey,
      btnCancelOnPress: () {
        Navigator.pop(context);
      },
      btnOkOnPress: () {
        Get.offAll(PreLoginScreen());
      },
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

  Padding _pushNotificationListTile() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 5, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(fontSize: 15, text: 'Push Notifications'),
          Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(value: true, onChanged: (v) {})),
        ],
      ),
    );
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
              Get.to(ChangePasswordScreen());
            },
            child: Container(
              padding: EdgeInsets.only(left: 40, top: 10, bottom: 5),
              width: double.infinity,
              color: Colors.lightGreen,
              child: CustomText(fontSize: 15, text: 'Change Password'),
            ),
          ),
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
            onTap: () {
              Get.back();
              Get.to(CardDetailsScreen());
            },
            child: Container(
              padding: EdgeInsets.only(left: 40, top: 10, bottom: 5),
              width: double.infinity,
              color: Colors.lightGreen,
              child: CustomText(fontSize: 15, text: 'Card Details'),
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
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: Transform.scale(
              scale: .7,
              child: IconButton(
                onPressed: () {
                  Get.back();
                  Get.to(ProfileScreen());
                },
                icon: Image.asset(AssetPath.edit),
              ),
            ),
          ),
          const Flexible(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: CircleAvatar(
                radius: 48,
                
            backgroundColor: Colors.green,
                backgroundImage: AssetImage(AssetPath.user),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          CustomText(
            text: "user name".toUpperCase(),
            fontSize: 20,
            fontweight: FontWeight.bold,
          ),
          SizedBox(height: 10.h),
          CustomText(
            text: "Username@domain.com ",
            fontSize: 13,
            color: AppColors.grey,
          ),
          CustomText(
            text: "male,30 years old",
            fontSize: 13,
            color: AppColors.grey,
          ),
          CustomText(
            text: "Newyork,NY",
            fontSize: 13,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}
