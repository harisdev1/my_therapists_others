import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import '../utils/app_colors.dart';

class PushNotificationButton extends StatefulWidget {
  const PushNotificationButton({Key? key}) : super(key: key);
  @override
  State<PushNotificationButton> createState() => _PushNotificationButtonState();
}

class _PushNotificationButtonState extends State<PushNotificationButton> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), 
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 14.0),
            child: CustomText(
              fontSize: 17.sp,
              text: 'Push Notifications',
            ),
          ),
          CupertinoSwitch(
            activeColor: AppColors.grey,
            value: value,
            onChanged: (v) => setState(() => value = v),
          ),
        ],
      ),
    );
  }
}
