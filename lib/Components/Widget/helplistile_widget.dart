import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class Helpsupport_tile_widget extends StatelessWidget {
  String title;
  String? icon;
  IconData? trailing;
  Function onpressed;
  Helpsupport_tile_widget(
      {super.key,
      required this.title,
      this.trailing,
      this.icon,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onpressed();
      },
      leading: SvgPicture.asset(icon!),
      title: Text(
        title,
        style: manageData.appTextTheme.fs16Normal,
      ),
      trailing: Icon(
        trailing,
        size: 30,
        color: manageData.appColors.primary,
      ),
    );
  }
}
