import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_therapists/utils/app_colors.dart';

class DropDown extends StatefulWidget {
  String? dropDownValue;
  DropDown({Key? key, this.dropDownValue}) : super(key: key);
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        // layoutBehavior: ButtonBarLayoutBehavior.constrained,
        alignedDropdown: true,
        child: DropdownButton(
          //validator: ((value) => ),
          hint: widget.dropDownValue == null
              ? Text(
                  'Select Gender',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 15.sp,
                  ),
                )
              : Text(
                  widget.dropDownValue!,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 15.sp,
                  ),
                ),
          iconSize: 30.0,
          items: ['Male', 'Female'].map(
            (val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(
                  val,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 15.sp,
                  ),
                ),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
              () {
                widget.dropDownValue = val! as String?;
              },
            );
          },
        ),
      ),
    );
  }
}
