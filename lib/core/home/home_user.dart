// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/core/home/guest_drawer.dart';
import 'package:my_therapists/core/home/user_drawer.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/utils/shared_preferences.dart';
import 'package:my_therapists/widgets/Exit_Confirmation.dart';
import 'package:my_therapists/widgets/center_logo.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';
import 'package:my_therapists/widgets/textfield.dart';

class UserHomeScreen extends StatefulWidget {
  final bool isGuest;

  const UserHomeScreen({
    super.key,
    this.isGuest = true,
  });

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

final _boothImagesList = [
  AssetPath.booth1,
  AssetPath.booth2,
  AssetPath.booth3,
  AssetPath.booth4,
  AssetPath.booth3,
  AssetPath.booth2,
  AssetPath.booth1,
  AssetPath.booth4,
];

class _UserHomeScreenState extends State<UserHomeScreen> {
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await showDialog(
        context: context,
        builder: (context) => exitConfirmationDialog(context),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: widget.isGuest ? CustomGuestDrawer() : CustomUserDrawer(),
        appBar: _homeAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _logo(),
              SizedBox(height: 20.h),
              _searchTextField(),
              SizedBox(height: 20.h),
              if (!widget.isGuest) ...[
                _nextAppointmentLabel(),
                SizedBox(height: 15),
                _nextAppointmentCard(),
                SizedBox(height: 15),
              ],
              _popularLabel(),
              SizedBox(height: 15),
              _boothsGridView(),
            ],
          ),
        ),
      ),
    );
  }

  CustomAppBar _homeAppBar() {
    return CustomAppBar(
      title: 'Home',
      leading: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image(
              image: AssetImage(
                AssetPath.drawer,
              ),
            ),
          ),
        );
      }),
    );
  }

  CustomText _nextAppointmentLabel() =>
      CustomText(fontSize: 16.sp, text: 'Next Appointment');

  Row _popularLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(fontSize: 16.sp, text: 'Popular'),
        // CustomText(fontSize: 14.sp, text: 'See All'),
      ],
    );
  }

  CustomTextfield _searchTextField() =>
      CustomTextfield(borderColor: AppColors.grey, hint_Text: 'Search');

  Center _logo() {
    return Center(
      child: CenterLogo(
        logoWidth: 100.w,
        logoHeight: 100.h,
      ),
    );
  }
}

Widget _boothsGridView() {
  return Flexible(
    child: GridView.builder(
        padding: EdgeInsets.all(0),
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return _boothCard(index);
        }),
  );
}

Widget _boothCard(int index) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 2,
                  color: AppColors.green,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  _boothImagesList[index],
                  fit: BoxFit.cover,
                ),
              )),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Text('Booth ${index + 1}'),
        )
      ],
    ),
  );
}

Widget _nextAppointmentCard() {
  return ListTile(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: AppColors.green, width: 1),
      borderRadius: BorderRadius.circular(5),
    ),
    contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
    trailing: Column(
      children: [
        CustomText(fontSize: 20.sp, text: '02', color: AppColors.green),
        CustomText(fontSize: 16.sp, text: 'Sep'),
      ],
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
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      text: "Lisa Marie", fontSize: 16,
                      // style: StyleForText.boldTitlePrimaryColorStyle,
                    ),
                    Row(
                      children: [
                        const ImageIcon(
                          AssetImage(AssetPath.location),
                          color: AppColors.green,
                        ),
                        SizedBox(width: 5),
                        CustomText(fontSize: 13.sp, text: 'NewYork'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
