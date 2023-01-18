// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/chat/messages.dart';
import 'package:my_therapists/core/service/services.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/utils/shared_preferences.dart';
import 'package:my_therapists/utils/themes/calendar_theme.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/flushbar.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

final _packagImagesList = [
  AssetPath.service1,
  AssetPath.service2,
  AssetPath.service3,
  AssetPath.service4,
  AssetPath.service5,
  AssetPath.service6,
];

class MasseurDetailsScreen extends StatefulWidget {
  const MasseurDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MasseurDetailsScreen> createState() => _MasseurDetailsScreenState();
}

class _MasseurDetailsScreenState extends State<MasseurDetailsScreen> {
  DateTime _chosenDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onTap: () => Get.back()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                _imageAvatar(),
                SizedBox(height: 10.h),
                _ratingBar(),
                SizedBox(height: 20.h),
                _messageAndServiceWidget(),
                SizedBox(height: 15.h),
                _packagesLabel(),
                SizedBox(height: 20.h),
                _packagesListView(),
                SizedBox(height: 20.h),
                _availableSlotsWidget(),
                SizedBox(height: 20.h),
                _calendar(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _availableSlotsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(fontSize: 15, text: 'Available Slots'),
        // ImageIcon(
        //   AssetImage(AssetPath.download),
        // ),
      ],
    );
  }

  Widget _packagesLabel() {
    return Align(
      alignment: Alignment.topLeft,
      child: CustomText(fontSize: 15, text: 'Packages'),
    );
  }

  Widget _imageAvatar() {
    return Center(
      child: CircleAvatar(
        radius: 52,
        backgroundColor: AppColors.green,
        child: CircleAvatar(
          backgroundColor: AppColors.green,
          radius: 50,
          backgroundImage: AssetImage(AssetPath.men1),
        ),
      ),
    );
  }

  Widget _packagesListView() {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ListView.separated(
        clipBehavior: Clip.none,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _packageCard(_packagImagesList[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget _packageCard(String imageAssetPath) {
    return SizedBox(
      width: 150,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(width: 1, color: AppColors.green),
        ),
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            imageAssetPath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _messageAndServiceWidget() {
    return Row(
      children: [
        Expanded(
          child: SimpleButton(
            button_label: 'Message',
            button_color: AppColors.green,
            onButtonPressed: () {
              bool? isGuest = SharedPrefs.instance.getBool('guest');
              if (isGuest == true) {
                FlushBar.showFlushBar(
                    context, 'Login To Interact with masseur');
              } else {
                Get.to(MessageScreen());
              }
            },
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: SimpleButton(
            button_label: 'Services',
            label_color: AppColors.lightGrey,
            button_color: AppColors.lightGrey2,
            onButtonPressed: () {
              Get.to(ServicesScreen(), transition: Transition.fade);
            },
          ),
        )
      ],
    );
  }

  Widget _ratingBar() {
    return RatingBar.builder(
      initialRating: 4.5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: 18,
      itemCount: 5,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: AppColors.black,
      ),
      onRatingUpdate: (rating) {},
    );
  }

  Widget _calendar() => Container(
        height: 370.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(70),
              offset: const Offset(2.0, 2.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: TableCalendar(
          shouldFillViewport: true,
          selectedDayPredicate: (day) {
            return isSameDay(_chosenDate, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _chosenDate = selectedDay;
              debugPrint(_chosenDate.toString());
            });
          },
          daysOfWeekHeight: 50,
          calendarBuilders: CalendarTheme.calendarBuilder(),
          headerStyle: CalendarTheme.headerStyle(),
          calendarStyle: CalendarTheme.calendarStyle(),
          focusedDay: _chosenDate,
          firstDay: DateTime.now(),
          lastDay: DateTime(2050, 1, 1),
        ),
      );
}
