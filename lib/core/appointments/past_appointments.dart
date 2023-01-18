import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';

class PastAppointmentScreen extends StatelessWidget {
  const PastAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              _appointmentList(
                  trailingIconPath: AssetPath.loading,
                  leadingColor: Colors.amber,
                  status: 'Pending',
                  date: 'Sep\n01'),
              SizedBox(height: 30),
              CustomText(fontSize: 20, text: 'Past Appointments'),
              SizedBox(height: 30),
              _pastAppointmentsListView(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _pastAppointmentsListView() {
  return ListView.separated(
    shrinkWrap: true,
    physics: BouncingScrollPhysics(),
    itemCount: 3,
    itemBuilder: (context, index) {
      return _appointmentList();
    },
    separatorBuilder: (BuildContext context, int index) {
      return SizedBox(height: 21);
    },
  );
}

Container _appointmentList(
    {String? date,
    String? status,
    Color? leadingColor,
    String? trailingIconPath}) {
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
                  color: leadingColor ?? AppColors.green,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(70),
                        offset: const Offset(2.0, 2.0),
                        blurRadius: 2.0)
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: CustomText(
                    textAlign: TextAlign.center,
                    fontSize: 20,
                    text: date ?? 'Jun\n01',
                    color: date != null ? AppColors.black : AppColors.white,
                  ),
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
                        text: status ?? "Completed", fontSize: 20,
                        // style: StyleForText.boldTitlePrimaryColorStyle,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: "Name\t",
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                          CustomText(
                            text: "Booth Name",
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ImageIcon(
                AssetImage(trailingIconPath ?? AssetPath.check),
                color: AppColors.green,
                //  color: Color(0xFF3A5A98),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
