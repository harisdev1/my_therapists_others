import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/profile/select_options.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';

import 'package:my_therapists/widgets/custom_dropdown.dart';
import 'package:my_therapists/widgets/custom_text.dart';

import 'package:my_therapists/widgets/simple_button.dart';
import 'package:my_therapists/widgets/textfield.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add New',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                _uploadImage(),
                SizedBox(height: 28.h),
                CustomTextfield(hint_Text: 'Service Name'),
                SizedBox(height: 15.h),
                CustomTextfield(hint_Text: "\$\$"),
                SizedBox(height: 15.h),
                CustomTextfield(hint_Text: "Duration"),
                SizedBox(height: 15.h),
                CustomTextfield(
                  hint_Text: AppStrings.bio,
                  textFieldHeight: 107.h,
                  fieldType: TextInputType.multiline,
                  maxLines: 4,
                ),
                SizedBox(height: 15.h),
                SimpleButton(
                  button_color: AppColors.green,
                  button_label: 'Add',
                  onButtonPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Get.to(SelectOptionsScreen());
                  },
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _uploadImage() => Container(
      //color: Colors.black.withOpacity(0.3),
      child: GestureDetector(
        onTap: () async {
          //    imageOptionsBottomSheet();
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          height: 130.h,
          width: double.infinity,
          child: DottedBorder(
            padding: const EdgeInsets.all(0),
            color: AppColors.green,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 50.w,
                    height: 50.h,
                    image: const AssetImage(AssetPath.uploadImage),
                  ),
                  SizedBox(height: 15.h),
                  CustomText(fontSize: 15.sp, text: 'Upload Image'),
                ],
              ),
            ),
          ),
        ),
      ),
    );

Widget _customDropDown() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: AppColors.green),
        ),
        height: 50.h,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 3.0, left: 10.0),
        child: DropDown(),
      ),
    ],
  );
}
