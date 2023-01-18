// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/1)masseur_module/appointment/masseur_past_appointments.dart';
import 'package:my_therapists/core/1)masseur_module/home/home_masseur.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/simple_button.dart';

class MasseurAppointmentScreen extends StatelessWidget {
  const MasseurAppointmentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 33.h),
              const CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.green,
                backgroundImage: AssetImage(AssetPath.men1),
              ),
              SizedBox(height: 20.h),
              CustomText(fontSize: 22, text: "Customer"),
              SizedBox(height: 20.h),
              _upcomingAppointmentsCard(),
              SizedBox(height: 31.h),
              SimpleButton(
                button_color: AppColors.green,
                button_label: "Past Appointments",
                onButtonPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Get.to(MasseurPastAppointmentScreen());
                  ;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _upcomingAppointmentsCard() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.dimWhite,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(70),
          offset: const Offset(2.0, 2.0),
          blurRadius: 10.0,
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 18, left: 18, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              fontSize: 18, fontweight: FontWeight.w400, text: "UpComming"),
          SizedBox(height: 10),
          Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: AppColors.green,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        fontSize: 15,
                        text: 'Tomorrow',
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                  //  SizedBox(height: 5),
                  cardInnerDetail(),
                  Row(
                    children: [
                      const ImageIcon(
                        AssetImage(AssetPath.location),
                        color: AppColors.green,
                      ),
                      SizedBox(width: 5),
                      CustomText(
                        fontSize: 13.sp,
                        text: 'NewYork',
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SimpleButton(
                        buttonWidth: 120.w,
                        labelFontSize: 12,
                        button_color: AppColors.green,
                        button_label: "Approve",
                        onButtonPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                            fontSize: 12.sp,
                            text: '25 September',
                            fontweight: FontWeight.bold,
                          ),
                          CustomText(
                            fontweight: FontWeight.bold,
                            fontSize: 12.sp,
                            text: '12:35 am',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget cardInnerDetail() {
  return ListTile(
    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.grey,
          child: CircleAvatar(
            backgroundColor: AppColors.green,
            radius: 28,
            backgroundImage: AssetImage(AssetPath.user),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomText(
                  text: "With Alex",
                  fontSize: 20,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Service\t",
                      color: AppColors.grey,
                      fontSize: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
