// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:entry/entry.dart';
import 'package:get/get.dart';
import 'package:my_therapists/auth/pre_login.dart';
import 'package:my_therapists/core/1)masseur_module/home/masseur_bottom_navigation.dart';
import 'package:my_therapists/utils/shared_preferences.dart';
import 'package:my_therapists/widgets/center_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SharedPrefs.instance.setBool('guest', true);
    _navigationTimer(seconds: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          _animatedLogo(),
          const Spacer(),
        ],
      ),
    );
  }
}

Timer _navigationTimer({required int seconds}) {
  return Timer(Duration(seconds: seconds), () {
    Get.off(PreLoginScreen(), transition: Transition.fade);
  });
}

Widget _animatedLogo() {
  return Center(
    child: Entry(
      xOffset: -1000,
      scale: 20,
      delay: Duration(milliseconds: 300),
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
      child: Entry(
        opacity: .5,
        angle: 3.1415,
        scale: .5,
        delay: Duration(milliseconds: 900),
        duration: Duration(milliseconds: 500),
        curve: Curves.decelerate,
        child: CenterLogo(
          logoWidth: 300.w,
          logoHeight: 300.w,
        ),
      ),
    ),
  );
}
