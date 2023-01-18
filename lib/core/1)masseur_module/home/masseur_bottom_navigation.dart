// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_therapists/auth/login.dart';
import 'package:my_therapists/auth/pre_login.dart';
import 'package:my_therapists/auth/signup.dart';
import 'package:my_therapists/core/1)masseur_module/appointment/masseur_appointments.dart';
import 'package:my_therapists/core/1)masseur_module/home/home_masseur.dart';
import 'package:my_therapists/core/1)masseur_module/appointment/upcoming_appointments.dart';
import 'package:my_therapists/core/appointments/user_appointments.dart';
import 'package:my_therapists/core/chat/chats.dart';
import 'package:my_therapists/core/home/guest_check.dart';
import 'package:my_therapists/core/home/home_user.dart';
import 'package:my_therapists/core/masseur/masseur.dart';
import 'package:my_therapists/core/notifications/user_notifications.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/utils/shared_preferences.dart';
import 'package:my_therapists/widgets/Exit_Confirmation.dart';
import 'package:my_therapists/widgets/center_logo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MasseurNavigationScreen extends StatefulWidget {
  final bool isMasseur;

  const MasseurNavigationScreen({
    super.key,
    this.isMasseur = false,
  });
  @override
  _MasseurNavigationScreenState createState() =>
      _MasseurNavigationScreenState();
}

class _MasseurNavigationScreenState extends State<MasseurNavigationScreen> {
  GlobalKey bottomNavigationKey = GlobalKey();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int _selectedTab = 1;
  late List _pages;
  @override
  void initState() {
    _pages = [
      if (widget.isMasseur == true) ...[
        MasseurAppointmentScreen(),
        MasseurHomeScreen(),
        ChatsScreen(),
      ]
    ];
    super.initState();
  }

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await showDialog(
        context: context,
        builder: (context) => exitConfirmationDialog(context),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _key,
        body: _pages[_selectedTab],
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: _floatingActionButton(),
        bottomNavigationBar: _customBottomNavigationBar(),
      ),
    );
  }

  Widget _floatingActionButton() {
    return Container(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        shape: const StadiumBorder(
          side: BorderSide(color: Colors.white, width: 1),
        ),
        onPressed: () {
          _changeTab(1);
        },
        backgroundColor: AppColors.green,
        child: ImageIcon(AssetImage(AssetPath.home)),
      ),
    );
  }

  Widget _customBottomNavigationBar() {
    return BottomNavigationBar(
      selectedLabelStyle:
          TextStyle(fontSize: 10, overflow: TextOverflow.visible),
      unselectedLabelStyle:
          TextStyle(fontSize: 10, overflow: TextOverflow.visible),
      currentIndex: _selectedTab,
      onTap: (index) => _changeTab(index),
      selectedItemColor: AppColors.green,
      unselectedItemColor: AppColors.grey,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(AssetPath.calendar2),
          ),
          label: 'Appointments',
        ),
        BottomNavigationBarItem(
            label: "",
            icon: Visibility(visible: false, child: Icon(Icons.home))),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AssetPath.chat)),
          label: 'Chats',
        ),
      ],
    );
  }
}
