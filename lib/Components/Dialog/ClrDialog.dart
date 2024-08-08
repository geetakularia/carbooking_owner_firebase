import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/CustomClipper/Close_clipper.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Widget/Custombackbutton.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClrDialog extends StatefulWidget {
  const ClrDialog({super.key});

  @override
  State<ClrDialog> createState() => _ClrDialogState();
}

class _ClrDialogState extends State<ClrDialog> {
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Color pickerColor = Color.fromARGB(255, 235, 19, 4);
  Color currentColor = Color(0xff443a49);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(alignment: Alignment.topRight, children: [
        Container(
          padding: EdgeInsets.all(15.0.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Colour',
                style: manageData.appTextTheme.fs24Normal,
              ),
              heightY(5.h),
              Text(
                "Title",
                style: manageData.appTextTheme.fs14Normal,
              ),
              heightY(10.h),
              Primary_txtField(
                hint_txt: "Enter",
                fillcolor: true,
              ),
              heightY(15.h),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: manageData.appColors.black.withOpacity(0.8)),
                child: ColorPicker(
                  labelTextStyle: manageData.appTextTheme.fs14Normal
                      .copyWith(color: manageData.appColors.white),
                  pickerAreaHeightPercent: 0.5,
                  pickerColor: pickerColor,
                  onColorChanged: changeColor,
                ),
              ),
              heightY(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryButton(
                      isExpanded: true,
                      backGroundTransparent: true,
                      title: "Reset",
                      onPressed: () {}),
                  widthX(15.w),
                  PrimaryButton(
                      isExpanded: true, title: "Save", onPressed: () {}),
                ],
              )
            ],
          ),
        ),
        ClipPath(
          clipper: CloseClipper(),
          child: CustomBackbutton(),
        ),
      ]),
    );
  }
}
