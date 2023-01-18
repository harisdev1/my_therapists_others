import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/payment/checkout.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleTimeScreen extends StatefulWidget {
  @override
  _ScheduleTimeScreenState createState() => _ScheduleTimeScreenState();
}

class _ScheduleTimeScreenState extends State<ScheduleTimeScreen> {
  bool toggleBorder = true;
  int checkedIndex = 0;

  List timeSlots = [
    '9:00 am',
    '10:00 am',
    '9:00 am',
    '10:00 am',
    '9:00 am',
    '10:00 am',
    '9:00 am',
    '10:00 am',
  ];
  @override
  Widget _timeSelectionGridView() {
    return Flexible(
      child: GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3,
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: timeSlots.length,
          itemBuilder: (context, index) {
            return _timeSelectionButton(index);
          }),
    );
  }

  Widget _timeSelectionButton(int index) {
    bool checked = index == checkedIndex;
    return InkWell(
      onTap: () => setState(() => checkedIndex = index),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
          width: 2,
          color: checked ? AppColors.green : Colors.grey,
        )),
        height: 10,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Center(child: Text(timeSlots[index])),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Schedule',
        onTap: () => Get.back(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            _selectTimeLbel(),
            SizedBox(height: 15),
            _timeSelectionGridView(),
            SizedBox(height: 15),
            _bookButton(),
          ],
        ),
      ),
    );
  }

  CustomText _selectTimeLbel() =>
      CustomText(fontSize: 16, text: 'Select a Time');

  SimpleButton _bookButton() {
    return SimpleButton(
      button_color: AppColors.green,
      button_label: 'Book',
      onButtonPressed: () {
        Get.to(CheckoutScreen(), transition: Transition.fade);
      },
    );
  }
}
