import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckBoxListTile_widget extends StatelessWidget {
  Color? fillclr;
  String title;
  String value;
  TextStyle? style;
  Function(String) onChanged;
  CheckBoxListTile_widget(
      {super.key,
      this.fillclr,
      required this.title,
      required this.onChanged,
      required this.value,
      this.style});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
        fillColor: WidgetStatePropertyAll(
            value == title ? manageData.appColors.primary : Colors.transparent),
        side: BorderSide(color: manageData.appColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        visualDensity: VisualDensity(horizontal: -4),
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          title,
          style: style == null ? manageData.appTextTheme.fs16Normal : style,
        ),
        value: value == title,
        onChanged: (v) => onChanged(title));
  }
}
