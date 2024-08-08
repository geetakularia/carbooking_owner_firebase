import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class Paymentlisttile_widget extends StatefulWidget {
  String title;
  String subtitle;
  String leadingicon;
  bool trailingicon;
  Color? bordercolor;
  Function onpressed;
  Paymentlisttile_widget(
      {super.key,
      required this.title,
      required this.onpressed,
      required this.subtitle,
      this.bordercolor,
      this.trailingicon = false,
      required this.leadingicon});

  @override
  State<Paymentlisttile_widget> createState() => _Paymentlisttile_widgetState();
}

class _Paymentlisttile_widgetState extends State<Paymentlisttile_widget> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      decoration: BoxDecoration(
        border:
            Border.all(color: widget.bordercolor ?? manageData.appColors.gray),
        color: manageData.appColors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ListTile(
        onTap: () {
          widget.onpressed();
        },
        minLeadingWidth: 0,
        trailing: widget.trailingicon == true
            ? Checkbox(
                activeColor: manageData.appColors.primary,
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              )
            : SizedBox(),
        leading: Container(
            height: 45.h,
            width: 45.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: manageData.appColors.gray.withOpacity(0.4))),
            child: SvgPicture.asset(
              widget.leadingicon,
            )),
        title: Text(
          widget.title,
          style: manageData.appTextTheme.fs18Medium,
        ),
        subtitle: Text(
          widget.subtitle,
          style: manageData.appTextTheme.fs14Normal,
        ),
      ),
    );
  }
}
