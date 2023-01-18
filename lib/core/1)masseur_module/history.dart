import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';

class AppointmentHistoryScreen extends StatelessWidget {
  const AppointmentHistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'History',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              _customerList(),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _CustomerListTile() {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(70),
          offset: const Offset(2.0, 2.0),
          blurRadius: 10.0,
        )
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
                      CustomText(
                        text: "Location",
                        color: AppColors.grey,
                        fontSize: 14,
                      ),
                      CustomText(
                        text: "01,June,2022",
                        color: AppColors.grey,
                        fontSize: 14,
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

Widget _customerList() {
  return ListView.separated(
    shrinkWrap: true,
    physics: BouncingScrollPhysics(),
    itemCount: 10,
    itemBuilder: (context, index) {
      return _CustomerListTile();
    },
    separatorBuilder: (BuildContext context, int index) {
      return SizedBox(height: 21);
    },
  );
}
