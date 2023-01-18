// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/1)masseur_module/home/masseur_bottom_navigation.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';

class ScheduleSuccessScreen extends StatefulWidget {
  const ScheduleSuccessScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleSuccessScreen> createState() => _ScheduleSuccessScreenState();
}

Timer _navigationTimer({required int seconds}) {
  return Timer(Duration(seconds: seconds), () {
    Get.off(
        MasseurNavigationScreen(
          isMasseur: true,
        ),
        transition: Transition.fade);
  });
}

class _ScheduleSuccessScreenState extends State<ScheduleSuccessScreen> {
  @override
  void initState() {
    super.initState();
    _navigationTimer(seconds: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 11),
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColors.green,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      AssetPath.service6,
                      height: 251.h,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 11),
                  CustomText(
                    fontSize: 25.sp,
                    color: AppColors.green,
                    text: 'Thank You ! ',
                  ),
                  SizedBox(height: 5),
                  CustomText(
                    color: AppColors.grey,
                    fontSize: 18,
                    text: 'You will be notified before',
                  ),
                  SizedBox(width: 10),
                  CustomText(
                    color: AppColors.grey,
                    fontSize: 18,
                    text: ' the appointment',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
