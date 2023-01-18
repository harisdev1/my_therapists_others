import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/utils/app_colors.dart';
import '../utils/asset_path.dart';

class CenterLogo extends StatelessWidget {
  final double logoWidth;
  final double logoHeight;
  final bool isShadowContainer;

  const CenterLogo(
      {super.key,
      required this.logoWidth,
      required this.logoHeight,
      this.isShadowContainer = false});

  @override
  Widget build(BuildContext context) {
    return Entry(
      scale: 0.3,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInBack,
      child: _logo(),
    );
  }

  Widget _logo() {
    return Container(
      decoration: isShadowContainer
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            )
          : null,
      child: Padding(
        padding: isShadowContainer
            ? EdgeInsets.only(
                left: 5.w,
                right: 5.w,
                top: 17.h,
                bottom: 16.h,
              )
            : EdgeInsets.zero,
        child: Image.asset(
          AssetPath.logo,
          width: logoWidth,
          height: logoHeight,
        ),
      ),
    );
  }
}
