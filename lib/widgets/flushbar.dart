import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/widgets/custom_text.dart';


class FlushBar {
  static Future<void> showFlushBar(context, text, {color, fontColor}) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      barBlur: 10,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      borderRadius: BorderRadius.circular(8),
      messageText: CustomText(
        text: text, 
        fontSize: 16.sp,
        //maxLines: 6,
        color: fontColor ?? AppColors.white,
      ),
      backgroundColor: color ?? AppColors.green,
      blockBackgroundInteraction: true,
      duration: const Duration(milliseconds: 1100),
    ).show(context);
  }
}
