import 'package:car_booking_owner/Components/Dropdownbutton/dropdown_widget.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreatePackageWidget extends StatelessWidget {
  TextEditingController ammount;
  Function deleteOnpressed;
  late Function onchanged;
  final String? selectedValue;
  final List<String> dropdownItems;
  PackageType typeenum;
  CreatePackageWidget(
      {super.key,
      required this.ammount,
      required this.deleteOnpressed,
      required this.dropdownItems,
      required this.selectedValue,
      required this.onchanged,
      required this.typeenum});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Primarydropdownbutton_widget(
              hint: "Per hour",
              onChanged: (v) {
                onchanged(v);
                // setState(() {
                //   _packagetype_value = p0;
                // });
              },
              selectedValue: selectedValue,
              dropdownItems: dropdownItems,
              title: languageconst.packageType.tr),
        ),
        widthX(15.w),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              languageconst.amount.tr,
              style: manageData.appTextTheme.fs16Normal
                  .copyWith(color: manageData.appColors.primary),
            ),
            heightY(10.h),
            Primary_txtField(
              controller: ammount,
              hint_txt: "000",
              fillcolor: true,
            ),
          ],
        )),
        widthX(15.w),
        InkWell(
          onTap: () {
            deleteOnpressed();
          },
          child: Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
                color: manageData.appColors.bgclr,
                borderRadius: BorderRadius.circular(10.r)),
            child: Icon(
              Icons.delete_outlined,
              color: manageData.appColors.red,
              size: 30.sp,
            ),
          ),
        )
      ],
    );
  }
}
