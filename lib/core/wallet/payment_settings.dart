// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/simple_button.dart';

class PaymentSettingsScreen extends StatelessWidget {
  const PaymentSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'Payment Settings',
        onTap: () => Get.back(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomText(
                fontSize: 22.sp,
                fontweight: FontWeight.w400,
                text: 'Enter Topup Amount'),
            const SizedBox(height: 10),
            _topupTextField(),
            const SizedBox(height: 20),
            CustomText(
                fontSize: 18.sp,
                fontweight: FontWeight.w400,
                text: 'Select Card To Continue'),
            const SizedBox(height: 20),
            _transactionsListView(),
            const SizedBox(height: 20),
            SimpleButton(
              button_color: AppColors.green,
              button_label: 'Check Out',
              onButtonPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          ],
        ),
      ),
    );
  }
}

var cards = [AssetPath.visa, AssetPath.jcb];
Widget _transactionsListView() {
  return Flexible(
    child: ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 2,
      itemBuilder: (context, index) {
        return _transactionListTileWidget(cards[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 5);
      },
    ),
  );
}

Widget _transactionListTileWidget(String cardPath) {
  return Card(
    elevation: 5,
    child: ListTile(
      leading: Container(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(cardPath),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: CustomText(
          fontSize: 17, color: AppColors.black, text: 'Jason Hankins'),
      subtitle: CustomText(
          fontSize: 15, color: AppColors.grey, text: '4000111031018855'),
      trailing: ImageIcon(
        AssetImage(AssetPath.forward),
      ),
    ),
  );
}

Widget _topupTextField() {
  return Container(
    width: double.infinity,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.green, width: 2),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 11),
              TextFormField(
                //  controller: TextEditingController()..text = '\$ ',
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: TextStyle(fontSize: 40, color: AppColors.green),
                decoration: InputDecoration(
                  prefixIcon: CustomText(
                    fontSize: 40,
                    text: '\$',
                    color: AppColors.green,
                  ),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 5),
              CustomText(
                fontSize: 20.sp,
                text: 'Total Balance',
                fontweight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
