import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/app_strings.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/core/wallet/payment_settings.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/simple_button.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: (() => Get.back()),
        title: 'My Wallet',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _topupCard(),
            const SizedBox(height: 20),
            CustomText(fontSize: 18.sp, text: 'Transaction History'),
            const SizedBox(height: 20),
            _transactionsListView(),
          ],
        ),
      ),
    );
  }
}

Widget _transactionsListView() {
  return Expanded(
    child: ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return _transactionListTileWidget();
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 5);
      },
    ),
  );
}

Widget _transactionListTileWidget() {
  return Container(
    child: Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    fontSize: 17, color: AppColors.green, text: 'April 4.2022'),
                CustomText(fontSize: 15, text: 'John Moriarity'),
              ],
            ),
            CustomText(fontSize: 12, text: '02:30'),
          ],
        ),
      ),
    ),
  );
}

Widget _topupCard() {
  return Container(
    width: double.infinity,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.green,
          image: DecorationImage(
            image: AssetImage(AssetPath.walletBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 11),
              CustomText(
                  fontSize: 50, text: '\$ 180.0', color: AppColors.white),
              SizedBox(height: 5),
              CustomText(
                fontSize: 20.sp,
                text: 'Total Balance',
                color: AppColors.white,
                fontweight: FontWeight.bold,
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.w),
                child: SimpleButton(
                  button_label: 'Top-Up',
                  label_color: AppColors.black,
                  button_color: AppColors.white,
                  onButtonPressed: () {
                    Get.to(PaymentSettingsScreen(),
                        transition: Transition.fade);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
