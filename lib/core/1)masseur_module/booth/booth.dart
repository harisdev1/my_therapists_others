import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/1)masseur_module/booth/booth_details.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';

class BoothsScreen extends StatefulWidget {
  @override
  _BoothsScreenState createState() => _BoothsScreenState();
}

class _BoothsScreenState extends State<BoothsScreen> {
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
    AssetPath.booth3,
    AssetPath.booth2,
    AssetPath.booth1,
    AssetPath.booth4,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Booths',
        onTap: () => Get.back(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            // SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(BoothDetailsScreen(
                            boothImagePath: _boothImagesList[index],
                            boothName: 'Booth ${index + 1}'));
                      },
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
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CustomText(
                                      fontSize: 16,
                                      fontweight: FontWeight.w500,
                                      text: 'Booth ${index + 1}')),
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                child: CustomText(
                                  fontSize: 15,
                                  text: '\$49',
                                  fontweight: FontWeight.bold,
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
