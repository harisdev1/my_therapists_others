import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';

class UserNotificationsScreen extends StatelessWidget {
  const UserNotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
        isLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        child: Column(
          children: [
            // SizedBox(height: 20),
            // CustomText(
            //     fontSize: 20,
            //     text: 'Notifications',
            //     fontweight: FontWeight.bold),
            //  SizedBox(height: 20),
            _notificationsListView(),
          ],
        ),
      ),
    );
  }
}

Widget _notificationsListView() {
  return Expanded(
    child: ListView.separated(
      padding: EdgeInsets.zero,
      // physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return _notificationListTileWidget();
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 5);
      },
    ),
  );
}

Widget _notificationListTileWidget() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w),
    child: Card(
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CustomText(
                fontSize: 13, color: AppColors.grey, text: AppStrings.lorem),
            Align(
                alignment: Alignment.centerRight,
                child: CustomText(fontSize: 12, text: '02:30')),
          ],
        ),
      ),
    ),
  );
}
