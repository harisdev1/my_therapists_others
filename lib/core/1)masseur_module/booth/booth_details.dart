import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/simple_button.dart';

class BoothDetailsScreen extends StatelessWidget {
  String boothName;
  String boothImagePath;
  BoothDetailsScreen(
      {required this.boothImagePath, required this.boothName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: boothName,
        onTap: () => Get.back(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(height: 28),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.green,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Image.asset(
                boothImagePath,
                height: 251.h,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10.h),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          color: AppColors.grey,
                          fontSize: 20.sp,
                          text: boothName,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.green),
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.dimWhite,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.phone,
                                  color: AppColors.green,
                                ),
                                SizedBox(width: 10),
                                CustomText(
                                  fontSize: 15.sp,
                                  color: AppColors.green,
                                  text: '856-326-2020',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 11),
                    CustomText(
                      fontSize: 15.sp,
                      text: AppStrings.lorem,
                    ),
                    SizedBox(height: 11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          color: AppColors.green,
                          fontSize: 25.sp,
                          text: '\$49',
                        ),
                        SizedBox(width: 10),
                        CustomText(
                          color: AppColors.grey,
                          fontSize: 25.sp,
                          text: '5 hr',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 28),
            SimpleButton(
              button_label: AppStrings.book,
              button_color: AppColors.green,
              onButtonPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;

  _MenuItem(this.icon, this.title);
}
