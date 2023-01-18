import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/chat/messages.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/textfield.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(height: 20),
            CustomTextfield(borderColor: AppColors.grey, hint_Text: 'Search'),
            SizedBox(height: 20),
            _chatsListView(),
          ],
        ),
      ),
    );
  }
}

Widget _chatsListView() {
  return Expanded(
    child: ListView.separated(
      padding: EdgeInsets.zero,
      // physics: BouncingScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return _chatListTile();
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 5);
      },
    ),
  );
}

Widget _chatListTile() {
  return GestureDetector(
    onTap: () => Get.to(MessageScreen()),
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
        trailing: Column(
          children: [],
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
                    backgroundImage: AssetImage(AssetPath.men1),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomText(
                          text: "Lisa Marie",
                          fontSize: 16,
                        ),
                        SizedBox(height: 5),
                        CustomText(
                          fontSize: 13.sp,
                          color: AppColors.grey,
                          text: 'Lorem ipsum dolor sit adipising elit',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
