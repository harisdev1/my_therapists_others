// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/service/service_details.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final _serviceImagesList = [
    AssetPath.service1,
    AssetPath.service2,
    AssetPath.service3,
    AssetPath.service4,
    AssetPath.service5,
    AssetPath.service1,
    AssetPath.service2,
    AssetPath.service3,
    AssetPath.service4,
    AssetPath.service5,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Services', onTap: () => Get.back()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Expanded(
              child: _servicesGridView(),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  GridView _servicesGridView() {
    return GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                ServiceDetailsScreen(
                  serviceNumber: index + 1,
                  serviceimagePath: _serviceImagesList[index],
                ),
                transition:Transition.fade
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(70),
                    offset: const Offset(2.0, 2.0),
                    blurRadius: 2.0,
                  )
                ],
              ),
              child: _serviceCard(index),
            ),
          );
        });
  }

  Widget _serviceCard(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Hero(
            tag: index + 1,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  _serviceImagesList[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              child: Text('Service ${index + 1}'),
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              child: CustomText(
                fontSize: 15,
                text: '\$49',
                color: AppColors.green,
              ),
            ),
          ],
        )
      ],
    );
  }
}
