import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/schedule/schedule.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/utils/shared_preferences.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/flushbar.dart';
import 'package:my_therapists/widgets/simple_button.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final int serviceNumber;
  final String serviceimagePath;
  const ServiceDetailsScreen(
      {super.key, required this.serviceNumber, required this.serviceimagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Service $serviceNumber',
        onTap: () => Get.back(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(height: 28),
            _serviceImageCard(),
            SizedBox(height: 10.h),
            _serviceDetailsCard(),
            SizedBox(height: 28),
            _bookButton(context),
          ],
        ),
      ),
    );
  }

  SimpleButton _bookButton(BuildContext context) {
    return SimpleButton(
      button_label: AppStrings.book,
      button_color: AppColors.green,
      onButtonPressed: () async {
        bool? isGuest = SharedPrefs.instance.getBool('guest');
        if (isGuest == true) {
          FlushBar.showFlushBar(context, 'Login To continue Booking');
        } else {
          print(isGuest);
          Get.to(ScheduleScreen(), transition: Transition.fade);
        }
      },
    );
  }

  Card _serviceDetailsCard() {
    return Card(
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  color: AppColors.grey,
                  fontSize: 20.sp,
                  text: 'Service $serviceNumber',
                ),
                CustomText(
                  color: AppColors.green,
                  fontSize: 15.sp,
                  text: '\$49',
                ),
              ],
            ),
            SizedBox(height: 11),
            CustomText(
              fontSize: 15.sp,
              text: AppStrings.lorem,
            ),
            SizedBox(height: 11),
            CustomText(
              color: AppColors.green,
              fontSize: 18.sp,
              text: '5hr',
            ),
          ],
        ),
      ),
    );
  }

  Widget _serviceImageCard() {
    return Hero(
      tag: serviceNumber,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColors.green,
          ),
          borderRadius: BorderRadius.circular(21.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Image.asset(
          serviceimagePath,
          height: 251.h,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
