import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/custom_text.dart';

class CustomHeader extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  final bool iconvisibility;
  final bool titlevisibility;
  final bool? trailingiconvisiblity;
  final Widget? leading;
  final Widget? trailing;
  final Widget? centreImage;

  CustomHeader(
      {this.titlevisibility = true,
      this.iconvisibility = true,
      this.title,
      this.onTap,
      this.centreImage,
      this.leading,
      this.trailing,
      this.trailingiconvisiblity = false,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          iconvisibility
              ? GestureDetector(
                  onTap: onTap,
                  child: leading,
                )
              : Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 25.w,
                    height: 25.h,
                  ),
                ),
          Spacer(),
          Visibility(
            visible: titlevisibility,
            child: Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                child: Center(
                  child: centreImage,
                ),
              ),
            ),
          ),
          Spacer(),
          trailing ??
              SizedBox(
                height: 28.h,
                width: 28.w,
              )
        ],
      ),
    );
  }
}
