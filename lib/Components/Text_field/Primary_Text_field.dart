import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Primary_txtField extends StatefulWidget {
  String hint_txt;
  String? title;
  IconData? suffixicon, prefix;
  Function? suffix_onpressed, onpressed, prefix_onpressed;
  bool obscuretxt;
  bool fillcolor;
  bool readOnly;
  Function(String?)? validator;
  Function(String)? onChanged;
  TextEditingController? controller;
  Primary_txtField(
      {super.key,
      required this.hint_txt,
      this.suffixicon,
      this.suffix_onpressed,
      this.onpressed,
      this.fillcolor = false,
      this.obscuretxt = false,
      this.readOnly = false,
      this.validator,
      this.controller,
      this.onChanged,
      this.prefix_onpressed,
      this.title,
      this.prefix});

  @override
  State<Primary_txtField> createState() => _common_txtfieldState();
}

class _common_txtfieldState extends State<Primary_txtField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title == null
            ? const SizedBox()
            : Text(
                widget.title!,
                style: manageData.appTextTheme.fs16Normal,
              ),
        TextFormField(
          onChanged: (v) => setState(() {
            widget.onChanged != null ? widget.onChanged!(v.toString()) : null;
          }),
          readOnly: widget.readOnly,
          onTap: widget.onpressed != null ? () => widget.onpressed!() : null,
          controller: widget.controller,
          validator: widget.validator == null
              ? null
              : (value) => widget.validator!(value),
          obscureText: widget.obscuretxt,
          decoration: InputDecoration(
              // contentPadding: const EdgeInsets.all(15),
              constraints: BoxConstraints(minHeight: 50.h),
              prefixIcon: widget.prefix == null
                  ? null
                  : Icon(
                      widget.prefix,
                      color: manageData.appColors.primary,
                    ),
              suffixIcon: IconButton(
                  onPressed: widget.suffix_onpressed != null
                      ? () => widget.suffix_onpressed!()
                      : null,
                  icon: Icon(
                    widget.suffixicon,
                    color: manageData.appColors.gray,
                  )),
              hintStyle: manageData.appTextTheme.fs16Normal,
              hintText: widget.hint_txt,
              filled: true,
              fillColor: widget.fillcolor
                  ? manageData.appColors.bgclr
                  : manageData.appColors.white,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: manageData.appColors.white)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: manageData.appColors.white)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: manageData.appColors.red)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: manageData.appColors.red))),
        ),
      ],
    );
  }
}
