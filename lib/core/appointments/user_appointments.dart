import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/appointments/past_appointments.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/simple_button.dart';

class UserAppointmentScreen extends StatelessWidget {
  const UserAppointmentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Appointments',
        isLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: 26.h),
              // CustomText(fontSize: 22, text: "Appointment"),
              SizedBox(height: 37.h),
              _upcomingAppointmentsCard(),
              SizedBox(height: 10.h),
              _viewPastButton(),
            ],
          ),
        ),
      ),
    );
  }

  SimpleButton _viewPastButton() {
    return SimpleButton(
      button_color: AppColors.green,
      button_label: 'View Past',
      onButtonPressed: () {
        Get.to(PastAppointmentScreen(), transition: Transition.fade);
      },
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(fontSize: 16, text: "UpComing Appointments"),
              const ImageIcon(
                AssetImage(AssetPath.calendar),
                color: AppColors.green,
              ),
            ],
          ),
          SizedBox(height: 25.h),
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
                        fontSize: 12.sp,
                        text: 'Tomorrow',
                      ),
                    ],
                  ),
                  _cardInnerDetail(),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                            fontSize: 12.sp,
                            text: '25 September',
                          ),
                          CustomText(
                            fontSize: 12.sp,
                            text: '12:35 am',
                          ),
                        ],
                      ),
                      CustomText(
                        fontSize: 20,
                        text: 'Booth Name',
                        color: AppColors.grey,
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

Widget _appointmentListTile() {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(70),
          offset: const Offset(2.0, 2.0),
          blurRadius: 10.0,
        ),
      ],
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
    ),
    child: ListTile(
      title: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightGreen,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(70),
                        offset: const Offset(2.0, 2.0),
                        blurRadius: 2.0)
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomText(
                        text: "Customer 1", fontSize: 20,
                        // style: StyleForText.boldTitlePrimaryColorStyle,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: "01",
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                          CustomText(
                            text: ", JUne",
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CustomText(
                text: "\$50",
                color: AppColors.green,
                fontSize: 25,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _cardInnerDetail() {
  return ListTile(
    contentPadding: EdgeInsets.only(top: -5),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 32.r,
              backgroundColor: AppColors.grey,
              child: CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage(AssetPath.men1),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      text: "Masseur", fontSize: 16,
                      // style: StyleForText.boldTitlePrimaryColorStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
