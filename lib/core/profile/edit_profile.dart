// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:my_therapists/utils/field_validators.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/core/1)masseur_module/home/masseur_bottom_navigation.dart';
import 'package:my_therapists/core/profile/profile.dart';
import 'package:my_therapists/utils/app_colors.dart';
import 'package:my_therapists/utils/asset_path.dart';
import 'package:my_therapists/widgets/snackBar.dart';
import 'package:my_therapists/widgets/appbar.dart';
import 'package:my_therapists/widgets/custom_dropdown.dart';
import 'package:my_therapists/widgets/textfield.dart';
import 'package:my_therapists/widgets/image_cropper.dart';
import 'package:my_therapists/widgets/simple_button.dart';
import 'package:my_therapists/widgets/toast.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? image;
  File? cropImage;

  TextEditingController _nameCtrl = TextEditingController(text: 'John Smith');
  TextEditingController _genderCtrl = TextEditingController();
  TextEditingController _addressCtrl =
      TextEditingController(text: 'W32 washington');
  TextEditingController _bioCtrl =
      TextEditingController(text: 'Lorem ipsum assds');
  TextEditingController _dateCtrl = TextEditingController(text: '10/25/2020');

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      var tempImg = File(image.path);
      cropImage = await cropGivenImage(image.path);
      if (cropImage != null) {
        setState(
          () => this.image = cropImage,
        );
      } else {
        setState(() {
          this.image = tempImg;
        });
      }
    } on PlatformException catch (_) {
      customSnackBar('Failed to load Image');
    }
  }

  DateTime selectedDate = DateTime.now();
  var customFormat = DateFormat('dd-MM-yyyy');

  Future<void> showPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.green,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.green,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateCtrl.text = customFormat.format(selectedDate);
        print(_dateCtrl.text);
      });
    }
  }

  final _updateProfileFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Profile',
        onTap: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Form(
            key: _updateProfileFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 13.h),
                _profileAvatar(context),
                SizedBox(height: 28.h),
                _nameTextField(),
                SizedBox(height: 15.h),
                _customDropDown(),
                SizedBox(height: 15.h),
                _dobTextField(context),
                SizedBox(height: 15.h),
                _addressTextField(),
                SizedBox(height: 15.h),
                _bioTextField(),
                SizedBox(height: 15.h),
                _saveButton(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _profileAvatar(BuildContext context) {
    return GestureDetector(
      onTap: () => _showModalSheet(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 72.r,
            backgroundColor: AppColors.green,
            child: CircleAvatar(
              radius: 70.r,
              backgroundImage: image != null
                  ? Image.file(
                      image!,
                      fit: BoxFit.cover,
                    ).image
                  : AssetImage(AssetPath.user),
            ),
          ),
          if (image == null)
            Icon(
              Icons.camera_alt_sharp,
              color: AppColors.white,
              size: 30.w,
            ),
        ],
      ),
    );
  }

  SimpleButton _saveButton() {
    return SimpleButton(
      button_color: AppColors.green,
      button_label: 'Save',
      onButtonPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_updateProfileFormKey.currentState!.validate()) {
          Get.offAll(MasseurNavigationScreen(isMasseur: true),
              transition: Transition.fade);
          CustomToast.showToast(message: 'profile Updated');
        }
      },
    );
  }

  CustomTextfield _bioTextField() {
    return CustomTextfield(
      textController: _bioCtrl,
      textFieldHeight: 107.h,
      fieldType: TextInputType.multiline,
      maxLines: 4,
    );
  }

  CustomTextfield _addressTextField() => CustomTextfield(
        hint_Text: 'Address',
        fieldValidator: (value) => value?.validateEmpty,
        textController: _addressCtrl,
      );

  CustomTextfield _dobTextField(BuildContext context) {
    return CustomTextfield(
      fieldValidator: (value) => value?.validateEmpty,
      isReadOnly: true,
      textController: _dateCtrl,
      suffixIconButton: IconButton(
        padding: EdgeInsets.only(bottom: 1),
        onPressed: () => showPicker(context),
        icon: Icon(Icons.calendar_today),
      ),
    );
  }

  CustomTextfield _nameTextField() => CustomTextfield(
        // hint_Text: 'Name',
        textController: _nameCtrl,
        fieldValidator: (value) => value?.validateEmpty,
      );

  void _showModalSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Get.back();
                pickImage(ImageSource.camera);
              }),
          ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
              onTap: () {
                Get.back();
                pickImage(ImageSource.gallery);
              }),
        ],
      ),
    );
  }
}

Widget _customDropDown() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      border: Border.all(color: AppColors.green),
    ),
    height: 50.h,
    child: DropDown(dropDownValue: 'Male'),
  );
}
