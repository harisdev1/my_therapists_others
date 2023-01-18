// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/core/1)masseur_module/home/masseur_bottom_navigation.dart';
import 'package:my_therapists/core/schedule/sucess.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/textfield.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import '../../utils/app_strings.dart';

class BookNowScreen extends StatefulWidget {
  const BookNowScreen({Key? key}) : super(key: key);

  @override
  State<BookNowScreen> createState() => _BookNowScreenState();
}

class _BookNowScreenState extends State<BookNowScreen> {
  // Declare this variable
  int? selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _imageHeader(),
          SizedBox(height: 15.h),
          _checkoutLabel(),
          SizedBox(height: 15.h),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _paymentMethodSelection(),
                    SizedBox(height: 15.h),
                    _orderSummaryCard(),
                    SizedBox(height: 15.h),
                    _cashOnArrivalListTile(),
                    SizedBox(height: 15.h),
                    _paymentButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  CustomText _checkoutLabel() => CustomText(fontSize: 20, text: 'Checkout');

  SimpleButton _paymentButton() {
    return SimpleButton(
      button_label: 'Pay',
      button_color: AppColors.green,
      onButtonPressed: () {
        Get.to(ScheduleSuccessScreen(), transition: Transition.fade);
      },
    );
  }

  Widget _cashOnArrivalListTile() {
    return Card(
      elevation: 5,
      child: cardList(
        leading: CustomText(fontSize: 15, text: 'Cash On Arrival'),
      ),
    );
  }

  Widget _imageHeader() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(AssetPath.service6),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: AppColors.green, width: 1),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          height: 0.2.sh,
        ),
        backButton(),
      ],
    );
  }

  Widget backButton() {
    return Positioned(
      top: 20,
      left: 20,
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: ImageIcon(
          AssetImage(AssetPath.back),
          color: AppColors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _paymentMethodSelection() {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                fontSize: 16,
                text: 'Payment method',
                fontweight: FontWeight.bold,
              ),
              _cardListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderSummaryCard() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.green, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              fontSize: 16,
              text: 'Order Summary',
              fontweight: FontWeight.bold,
            ),
            SizedBox(height: 5.h),
            _orderEntry('Masseur'),
            SizedBox(height: 5.h),
            _orderEntry('Taxes'),
            SizedBox(height: 5.h),
            _orderEntry(
                'Total (inc.VaL)', 3, 16, FontWeight.bold, AppColors.green),
          ],
        ),
      ),
    );
  }

  Widget _orderEntry(
    String title, [
    double leftPadding = 15,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.bold,
    Color color = AppColors.black,
  ]) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            fontSize: fontSize,
            text: title,
          ),
          CustomText(
            fontSize: fontSize,
            text: '\$2.3',
            color: color,
            fontweight: fontWeight,
          ),
        ],
      ),
    );
  }

  Widget _cardListView() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return cardList(index: index + 1);
      },
    );
  }

  Widget cardList({Widget? leading, int? index}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: leading ??
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AssetPath.jcb,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        ),
        Transform.scale(
          scale: 1.5,
          child: Radio(
            value: index ?? 0,
            groupValue: selectedRadioTile,
            onChanged: (index) {
              setSelectedRadioTile(index as int);
            },
            activeColor: AppColors.green,
          ),
        ),
      ],
    );
  }
}
