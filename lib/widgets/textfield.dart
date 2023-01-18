// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/utils/app_colors.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatefulWidget {
  String? hint_Text;
  TextEditingController? textController;
  bool? isPasswordField;
  bool? isSuffixIcon;
  bool isReadOnly;
  bool isCenterText;
  IconButton? suffixIconButton;
  Color? borderColor;
  String? Function(String?)? fieldValidator;
  String? Function(String?)? onSaved;
  String? initialVal;
  TextInputType? fieldType;
  double? textFieldHeight;
  int? minLines;
  int? maxLines;
  Widget? prefix;
  void Function(String)? onChanged;
  CustomTextfield({
    this.minLines,
    this.maxLines,
    this.hint_Text,
    this.prefix,
    this.isReadOnly = false,
    this.textController,
    this.initialVal,
    this.isSuffixIcon,
    this.suffixIconButton,
    this.borderColor,
    this.fieldType = TextInputType.text,
    this.textFieldHeight,
    this.fieldValidator,
    this.onSaved,
    this.isPasswordField = false,
    this.isCenterText = false,
    this.onChanged,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            minLines: widget.minLines ?? 1,
            maxLines: (widget.isPasswordField == true) ? 1 : widget.maxLines,
            readOnly: widget.isReadOnly,
            initialValue: widget.initialVal,
            textAlign: widget.isCenterText ? TextAlign.center : TextAlign.left,
            keyboardType: widget.fieldType,
            validator: widget.fieldValidator,
            obscureText: widget.isPasswordField!,
            controller: widget.textController,
            onSaved: widget.onSaved,
            style: TextStyle(
              fontSize: 15.sp,
              color: AppColors.grey,
            ),
            decoration: InputDecoration(
              errorBorder: _border(),
              focusedBorder: _border(),
              focusedErrorBorder: _border(),
              enabledBorder: _border(),
              prefixIcon: widget.prefix,
              suffixIcon: widget.isSuffixIcon ?? false
                  ? IconButton(
                      icon: Icon(
                        isvisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isvisible = !isvisible;
                          widget.isPasswordField = !(widget.isPasswordField)!;
                        });
                      },
                    )
                  : widget.suffixIconButton,
              contentPadding:
                  EdgeInsets.only(top: 10.h, left: 9.w, bottom: 10.h),
              label: Text(widget.hint_Text ?? ''),
              floatingLabelStyle: TextStyle(color: AppColors.black),
              labelStyle: TextStyle(color: AppColors.grey, fontSize: 16),
              errorStyle: TextStyle(color: AppColors.tomato),
              hintStyle: TextStyle(
                color: AppColors.grey,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
        color: AppColors.green,
        width: 1.0,
      ),
    );
  }
}
