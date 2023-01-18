import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/1)masseur_module/home/masseur_bottom_navigation.dart';
import 'package:my_therapists/core/masseur/masseur_details.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/textfield.dart';

class MasseurScreen extends StatefulWidget {
  @override
  _MasseurScreenState createState() => _MasseurScreenState();
}

class _MasseurScreenState extends State<MasseurScreen> {
  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () => Get.to(MasseurNavigationScreen()),
        title: 'Masseur',
        isLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                CustomTextfield(
                    borderColor: AppColors.grey, hint_Text: 'Search'),
                SizedBox(height: 20.h),
                CustomText(fontSize: 16.sp, text: 'Masseurs'),
                SizedBox(height: 15.h),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(MasseurDetailsScreen(),
                        transition: Transition.fade),
                    child: _MasseurCard(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 21);
                },
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

Widget _MasseurCard() {
  var rating = 3.0;
  return ListTile(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: AppColors.green, width: 1),
      borderRadius: BorderRadius.circular(5),
    ),
    contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.green,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.green,
                backgroundImage: AssetImage(AssetPath.men1),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            CustomText(text: "Masseur", fontSize: 16),
          ],
        ),
        Spacer(),
        CustomText(text: "Bio Line", fontSize: 12),
        Spacer(),
        Column(
          children: [
            RatingBar.builder(
              initialRating: 4.5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemSize: 13,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: AppColors.black,
              ),
              onRatingUpdate: (rating) {},
            ),
            CustomText(fontSize: 10, color: AppColors.green, text: '3 Reviews'),
          ],
        ),
      ],
    ),
  );
}
