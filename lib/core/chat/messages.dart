// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_text.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30.h),
          _header(),
          _chatsBody(),
          _messageTextField(),
        ],
      ),
    );
  }

  Expanded _chatsBody() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: 20,
          reverse: true,
          itemBuilder: (context, i) {
            return Column(
              children: [
                _recievedmessage(),
                SizedBox(height: 8),
                _sentMessage(),
                SizedBox(height: 8),
              ],
            );
          },
        ),
      ),
    );
  }

  Material _messageTextField() {
    return Material(
      elevation: 20,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(70),
                offset: const Offset(0.0, 5.0),
                blurRadius: 2.0)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                fontSize: 15,
                text: 'Type message',
                color: AppColors.grey,
              ),
              Row(
                children: [
                  Icon(
                    Icons.image,
                    color: AppColors.grey,
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: ImageIcon(
                      AssetImage(AssetPath.telegram),
                      color: AppColors.green,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _header() {
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _backButton()),
        Spacer(flex: 2),
        Column(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: AppColors.grey,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AssetPath.men1),
              ),
            ),
            SizedBox(height: 2),
            CustomText(fontSize: 15, text: 'Masseur'),
          ],
        ),
        Spacer(flex: 3),
      ],
    );
  }

  GestureDetector _backButton() {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 0.0,
        ),
        child: ImageIcon(
          AssetImage(
            AssetPath.back,
          ),
          color: AppColors.green,
          size: 30,
        ),
      ),
    );
  }

  Widget _sentMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.green,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(70),
                        offset: const Offset(2.0, 2.0),
                        blurRadius: 2.0)
                  ],
                  borderRadius: BorderRadius.circular(5),
                  // border: Border.all(color: AppColors.grey, width: 2),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CustomText(
                    fontSize: 15,
                    text: 'Lorem ipsum sdssd wewwqwq wqw',
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(height: 3),
              CustomText(fontSize: 15, text: '2:30 PM', color: AppColors.grey),
            ],
          ),
          SizedBox(width: 10),
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.grey,
            child: CircleAvatar(
              backgroundColor: AppColors.green,
              radius: 22,
              backgroundImage: AssetImage(AssetPath.user),
            ),
          ),
        ],
      ),
    );
  }

  Widget _recievedmessage() {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.grey,
          child: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(AssetPath.men1),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 2.0)
                ],
                borderRadius: BorderRadius.circular(5),
                // border: Border.all(color: AppColors.grey, width: 2),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CustomText(
                  fontSize: 15,
                  text: 'Lorem ipsum sdssd wewwqwq wqw',
                  color: AppColors.grey,
                ),
              ),
            ),
            SizedBox(height: 3),
            CustomText(fontSize: 15, text: '2:30 PM', color: AppColors.grey),
          ],
        ),
      ],
    );
  }
}

class Message {
  String message;
  String timestamp;
  String imagePath;
  bool isMe;
  Message(
      {required this.message,
      required this.timestamp,
      required this.isMe,
      required this.imagePath});
}

var messages = [
  Message(
      message: 'Lorem ipsum ',
      timestamp: '2:30 PM',
      isMe: false,
      imagePath: AssetPath.men1),
  Message(
      message: 'Lorem ipsum ',
      timestamp: '2:30 PM',
      isMe: true,
      imagePath: AssetPath.user),
  Message(
      message: 'Lorem ipsum ',
      timestamp: '2:30 PM',
      isMe: false,
      imagePath: AssetPath.men1),
  Message(
      message: 'Lorem ipsum ',
      timestamp: '2:30 PM',
      isMe: true,
      imagePath: AssetPath.user),
  Message(
      message: 'Lorem ipsum ',
      timestamp: '2:30 PM',
      isMe: false,
      imagePath: AssetPath.men1),
  Message(
      message: 'Lorem ipsum ',
      timestamp: '2:30 PM',
      isMe: true,
      imagePath: AssetPath.user),
];
