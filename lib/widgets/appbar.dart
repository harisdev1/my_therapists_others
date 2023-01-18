// ignore_for_file: must_be_immutable, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  Widget? leading;
  Widget? centreWidget;
  final List<Widget>? trailing;
  void Function()? onTap;
  bool isLeading;
  CustomAppBar(
      {Key? key,
      this.onTap,
      this.title,
      this.isLeading = true,
      this.trailing,
      this.leading,
      this.centreWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      child: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leading: isLeading
            ? GestureDetector(
                onTap: onTap,
                child: leading ??
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: ImageIcon(
                        AssetImage(
                          AssetPath.back,
                        ),
                        color: AppColors.green,
                        size: 1,
                      ),
                    ),
              )
            : null,
        actions: trailing,
        centerTitle: true,
        title: Padding(
            padding: EdgeInsets.all(3.w),
            child: Padding(
              padding: EdgeInsets.only(),
              child: centreWidget ??
                  Text(
                    title ?? "",
                    style: const TextStyle(
                      overflow: TextOverflow.visible,
                      fontSize: 22,
                      color: AppColors.black,
                    ),
                  ),
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
