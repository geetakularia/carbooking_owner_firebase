import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Textfieldwithtitle extends StatelessWidget {
  String title, hint;
  Textfieldwithtitle({super.key, required this.title, required this.hint});

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
        Primary_txtField(
          hint_txt: hint,
          fillcolor: true,
        ),
      ],
    );
  }
}
