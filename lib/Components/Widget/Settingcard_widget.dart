import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SettingCard extends StatefulWidget {
  bool value;
  String title;
  
  SettingCard({super.key, required this.title, this.value = false});

  @override
  State<SettingCard> createState() => _SettingCardState();
}

class _SettingCardState extends State<SettingCard> {
  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: manageData.appTextTheme.fs14Normal
                  .copyWith(color: manageData.appColors.black),
            ),
            Switch(
                thumbColor: WidgetStatePropertyAll(manageData.appColors.white),
                trackColor: WidgetStatePropertyAll(manageData.appColors.black),
                trackOutlineColor:
                    WidgetStatePropertyAll(manageData.appColors.black),
                activeColor: manageData.appColors.primary,
                value: widget.value,
                onChanged: (value) {
                  setState(() {
                    widget.value = !widget.value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
