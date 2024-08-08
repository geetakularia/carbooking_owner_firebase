import 'package:car_booking_owner/Classes/manage_data.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CheckboxWidget extends StatelessWidget {
  CheckboxWidget({
    super.key,
    required this.text,
    required this.onSelect,
    required this.selected_vlaue,
    required this.checkcolor,
  });
  String text;
  String selected_vlaue;
  Function(String) onSelect;
  Color checkcolor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          splashRadius: 0.0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: font.appColors.primary,
          value: selected_vlaue == text,
          onChanged: (newvalue) => onSelect(text),
        ),
        widthX(10.w),
        Text(
          text,
          style: font.appTextTheme.fs14Normal,
        ),
      ],
    );

    // CheckboxListTile(
    //   contentPadding: EdgeInsetsDirectional.zero,
    //   title: Text(
    //     widget.text,
    //     style: widget.style.copyWith(
    //         color: widget.selected_text == widget.text
    //             ? alldataManager.getcolor.primaryColor
    //             : alldataManager.getcolor.black),
    //   ),
    //   value: widget.selected_text == widget.text,
    //   activeColor: widget.checkcolor,
    //   onChanged: (newValue) => widget.onSelect(widget.text),
    //   controlAffinity: ListTileControlAffinity.leading,
    // );
  }
}

final font = ConstantSheet.instance;
