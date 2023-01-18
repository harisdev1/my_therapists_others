// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/schedule/schedult_time.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/themes/calendar_theme.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _chosenDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Schedule', onTap: () => Get.back()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            _bookingDateLabel(),
            SizedBox(height: 15),
            _calendar(),
            SizedBox(height: 15),
            _proceedButton(),
          ],
        ),
      ),
    );
  }

  CustomText _bookingDateLabel() =>
      CustomText(fontSize: 16.sp, text: 'Select a Booking Date');

  SimpleButton _proceedButton() {
    return SimpleButton(
      button_label: 'Proceed',
      button_color: AppColors.green,
      onButtonPressed: () {
        Get.to(ScheduleTimeScreen(), transition: Transition.fade);
      },
    );
  }

  Widget _calendar() => Container(
        height: 350.h,
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
