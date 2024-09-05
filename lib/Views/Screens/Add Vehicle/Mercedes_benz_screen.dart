import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dropdownbutton/dropdown_widget.dart';
import 'package:car_booking_owner/Components/Text_field/Descriptiontextfield.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Localdata/Localdata.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Mercedesbenz_screen extends StatefulWidget {
  const Mercedesbenz_screen({super.key});

  @override
  State<Mercedesbenz_screen> createState() => _Mercedesbenz_screenState();
}

class _Mercedesbenz_screenState extends State<Mercedesbenz_screen> {
  String? packagetypevalue;
  final _description = TextEditingController();
  final _ammount = TextEditingController();
  String? _packagetype_value;

  @override
  Widget build(BuildContext context) {
    final carController = Get.find<FirebaseController>();
    // List<CreatePackageModel> CreatePackagelist = [];
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40.w,
        title: Text(
          "Mercedes Benz Q80 ( 2023 )",
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightY(10.h),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 6.w),
                decoration: BoxDecoration(
                    color: manageData.appColors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        bottomLeft: Radius.circular(20.r))),
                child: Text(
                  "${languageconst.step.tr} 2",
                  style: manageData.appTextTheme.fs16Normal
                      .copyWith(color: manageData.appColors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.sp),
              width: AppServices.screenWidth(context),
              padding: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                  color: manageData.appColors.white,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      languageconst.addBookingPriceAndDescription.tr,
                      style: manageData.appTextTheme.fs14Normal
                          .copyWith(color: manageData.appColors.gray),
                    ),
                    heightY(10.h),
                    Descriptiontextfield(
                      controller: _description,
                      hint: "Write something about your car as an introduction",
                    ),
                    heightY(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          languageconst.createPackage.tr,
                          style: manageData.appTextTheme.fs16Normal,
                        ),
                        InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(manageData.appsvgimg.add))
                      ],
                    ),
                    heightY(17.h),
                    Row(
                      children: [
                        Expanded(
                          child: Primarydropdownbutton_widget(
                              hint: "Per hour",
                              onChanged: (p0) {
                                setState(() {
                                  _packagetype_value = p0;
                                });
                              },
                              selectedValue: packagetypevalue,
                              dropdownItems: Localdata.packagedata,
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
                                  .copyWith(
                                      color: manageData.appColors.primary),
                            ),
                            heightY(10.h),
                            Primary_txtField(
                              controller: _ammount,
                              hint_txt: "650",
                              fillcolor: true,
                            ),
                          ],
                        )),
                        widthX(15.w),
                        InkWell(
                          onTap: () {},
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
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: Row(
                children: [
                  PrimaryButton(
                    title: languageconst.continueButton.tr,
                    onPressed: () async {
                      final data = carController.car.copyWith(
                          description: _description.text.trim(),
                          createpackagedata: [
                            CreatePackageModel(
                                ammount: int.tryParse(_ammount.text.trim()),
                                packagetype: _packagetype_value)
                          ]);
                      // SET DATA CAR
                      carController.setCar(data);
                      // NEXT SCREEN
                      Get.toNamed("/thumbnail_screen");
                    },
                    isExpanded: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
