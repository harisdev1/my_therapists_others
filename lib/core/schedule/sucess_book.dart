import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 11),
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.green,
                      child: Center(
                        child: Icon(
                          Icons.done,
                          color: AppColors.white,
                          size: 60,
                        ),
                      ),
                    ),
                    SizedBox(height: 11),
                    CustomText(fontSize: 15.sp, text: 'Masseur'),
                    SizedBox(height: 5),
                    _ratingBar(),
                    SizedBox(height: 10),
                    CustomText(
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      text: AppStrings.lorem,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }
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
