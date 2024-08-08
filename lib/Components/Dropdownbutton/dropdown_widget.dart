import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Primarydropdownbutton_widget extends StatelessWidget {
  final String? selectedValue;
  String hint;
  final List<String> dropdownItems;
  String title;
  Color? bgclr;
  Function(String)? onChanged;
  Primarydropdownbutton_widget(
      {super.key,
      required this.selectedValue,
      required this.dropdownItems,
      required this.hint,
      required this.title,
      this.bgclr,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: manageData.appTextTheme.fs16Normal
              .copyWith(color: manageData.appColors.primary),
        ),
        heightY(10.h),
        DropdownButtonFormField(
          isExpanded: true,
          hint: Text(
            hint,
            style: manageData.appTextTheme.fs16Normal
                .copyWith(color: manageData.appColors.gray),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down,
          ),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            filled: true,
            fillColor: bgclr == null ? manageData.appColors.bgclr : bgclr,
            border: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
          ),
          value: selectedValue,
          items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            onChanged!(value!);
          },
        ),
      ],
    );
  }
}
