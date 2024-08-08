import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class AddrowwithIcon_widget extends StatelessWidget {
  String title;
  Function onpressed;
  AddrowwithIcon_widget(
      {super.key, required this.title, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: manageData.appTextTheme.fs16Normal,
        ),
        GestureDetector(
            onTap: () {
              onpressed();
            },
            child: SvgPicture.asset(manageData.appsvgimg.add))
      ],
    );
  }
}
