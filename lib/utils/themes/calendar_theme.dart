// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/service/services.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarTheme {
  CalendarTheme._();
  static CalendarStyle calendarStyle() {
    return CalendarStyle(
      tablePadding: EdgeInsets.symmetric(horizontal: 10),
      weekendDecoration:
          BoxDecoration(color: AppColors.lightGrey2, shape: BoxShape.circle),
      defaultDecoration:
          BoxDecoration(color: AppColors.lightGrey2, shape: BoxShape.circle),
      todayDecoration: BoxDecoration(),
      selectedDecoration:
          BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
      weekendTextStyle: TextStyle(color: AppColors.black),
      defaultTextStyle: TextStyle(color: AppColors.black),
      todayTextStyle: TextStyle(color: AppColors.black),
      holidayTextStyle: TextStyle(color: AppColors.black),
    );
  }

  static HeaderStyle headerStyle() {
    return HeaderStyle(
      leftChevronIcon: CircleAvatar(
        backgroundColor: AppColors.green,
        radius: 20,
        child: Icon(Icons.chevron_left, color: Colors.white),
      ),
      rightChevronIcon: CircleAvatar(
        backgroundColor: AppColors.green,
        radius: 20,
        child: Icon(Icons.chevron_right, color: Colors.white),
      ),
      decoration: BoxDecoration(), //header
      titleTextStyle: TextStyle(color: AppColors.black),
      titleCentered: true,
      formatButtonVisible: false,
    );
  }

  static CalendarBuilders<dynamic> calendarBuilder() {
    return CalendarBuilders(
      dowBuilder: (context, day) {
        String formattedDate = DateFormat('EEEE').format(day);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.green,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.white,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.green,
                // color: Colors.red,
                // alignment: Alignment.center,
                child: Text(
                  formattedDate.substring(0, 2),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
