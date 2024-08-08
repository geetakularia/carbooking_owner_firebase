import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountTile extends StatelessWidget {
  final String txt, img;
  final Function onpressed;

  const AccountTile(
      {super.key,
      required this.txt,
      required this.img,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      onTap: () {
        onpressed();
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
      leading: Container(
        width: 25.w,
        child: SvgPicture.asset(
          img,
        ),
      ),
      title: Text(
        textAlign: TextAlign.start,
        txt,
        style: manageData.appTextTheme.fs14Normal,
      ),
    );
  }
}
