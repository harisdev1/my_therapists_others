import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/1)masseur_module/booth/booth.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/center_logo.dart';
import 'package:my_therapists/widgets/custom_header.dart';
import 'package:my_therapists/widgets/custom_text.dart';

class MasseurHomeScreen extends StatefulWidget {
  @override
  _MasseurHomeScreenState createState() => _MasseurHomeScreenState();
}

class _MasseurHomeScreenState extends State<MasseurHomeScreen> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  final _boothImagesList = [
    AssetPath.booth1,
    AssetPath.booth2,
    AssetPath.booth3,
    AssetPath.booth4,
    AssetPath.booth3,
    AssetPath.booth2,
    AssetPath.booth1,
    AssetPath.booth4,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              trailingiconvisiblity: true,
              leading: const CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.green,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.green,
                  backgroundImage: AssetImage(AssetPath.men1),
                ),
              ),
              centreImage: const CenterLogo(
                logoWidth: 80,
                logoHeight: 80,
              ),
              trailing: const CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.green,
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 15),
            CustomText(
              fontSize: 16.sp,
              text: 'Next Appointment',
            ),
            SizedBox(height: 15),
            upcomingAppointmentCard(),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(fontSize: 16.sp, text: 'Booths'),
                GestureDetector(
                    onTap: () {
                      Get.to(BoothsScreen());
                    },
                    child: CustomText(fontSize: 14.sp, text: 'See All')),
              ],
            ),
            // SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            child: Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 3,
                                    color: AppColors.green,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    _boothImagesList[index],
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('Booth ${index + 1}'),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget upcomingAppointmentCard() {
  return ListTile(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: AppColors.green, width: 1),
      borderRadius: BorderRadius.circular(5),
    ),
    contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
    trailing: Column(
      children: [
        CustomText(fontSize: 20.sp, text: '02', color: AppColors.green),
        CustomText(fontSize: 16.sp, text: 'Sep'),
      ],
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.green,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(AssetPath.user),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      text: "Lisa Marie", fontSize: 16,
                      // style: StyleForText.boldTitlePrimaryColorStyle,
                    ),
                    Row(
                      children: [
                        const ImageIcon(
                          AssetImage(AssetPath.location),
                          color: AppColors.green,
                        ),
                        SizedBox(width: 5),
                        CustomText(fontSize: 13.sp, text: 'NewYork'),
                      ],
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
