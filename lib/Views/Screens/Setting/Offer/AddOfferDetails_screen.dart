import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dropdownbutton/dropdown_widget.dart';
import 'package:car_booking_owner/Components/Text_field/Datetimetextfield.dart';
import 'package:car_booking_owner/Components/Text_field/Descriptiontextfield.dart';
import 'package:car_booking_owner/Components/Text_field/Textfieldwithtitle.dart';
import 'package:car_booking_owner/Components/Widget/AddOfferdetail.dart';
import 'package:car_booking_owner/Components/Widget/TieredDiscount_widget.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Localdata/Localdata.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddOfferDetails_screen extends StatefulWidget {
  const AddOfferDetails_screen({super.key});

  @override
  State<AddOfferDetails_screen> createState() => _AddOfferDetails_screenState();
}

class _AddOfferDetails_screenState extends State<AddOfferDetails_screen> {
  String? _offervalue;
  DateTime selectedDate = DateTime.now();
  final TextEditingController datecontrollrs = TextEditingController();
  String offerType = Get.arguments.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            PrimaryButton(
              title: languageconst.Reset.tr,
              backGroundTransparent: true,
              onPressed: () {},
            ),
            widthX(10.w),
            PrimaryButton(
              title: languageconst.UploadData.tr,
              onPressed: () {},
              isExpanded: true,
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          languageconst.addofferdetails.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                      color: manageData.appColors.white,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${languageconst.generaldiscount.tr} ${"(%)"}",
                            style: manageData.appTextTheme.fs18Normal,
                          ),
                          heightY(15.h),
                          Text(
                            "₹0.0",
                            style: manageData.appTextTheme.fs16Normal
                                .copyWith(color: manageData.appColors.gray),
                          ),
                        ],
                      ),
                      heightY(10.h),
                      Divider(
                        thickness: 2,
                      ),
                      heightY(10.h),
                      Text(
                        languageconst.addyourofferdetails.tr,
                        style: manageData.appTextTheme.fs14Normal,
                      ),
                      heightY(15.h),
                      Thumbnail_Banner_widget(
                         ),
                      heightY(15.h),
                      Text(
                        "${languageconst.aboutdiscount.tr} ${"(%)"}",
                        style: manageData.appTextTheme.fs16Normal,
                      ),
                      heightY(15.h),
                      Textfieldwithtitle(
                        title: languageconst.Title.tr,
                        hint: languageconst.enter.tr,
                      ),
                      heightY(15.h),
                      Textfieldwithtitle(
                        title: languageconst.couponCode.tr,
                        hint: languageconst.enterCodeHere.tr,
                      ),
                      heightY(15.h),
                      Descriptiontextfield(
                          hint: languageconst.writeshortdescription.tr),
                      heightY(15.h),
                      Text(
                        languageconst.Benefits.tr,
                        style: manageData.appTextTheme.fs16Normal
                            .copyWith(color: manageData.appColors.gray),
                      ),
                      heightY(10.h),
                      Row(
                        children: [
                          Expanded(
                            child: Textfieldwithtitle(
                              title: languageconst.DiscountValue.tr,
                              hint: "₹0.0",
                            ),
                          ),
                          widthX(10.w),
                          Expanded(
                            child: Textfieldwithtitle(
                              title: languageconst.DiscountUnit.tr,
                              hint: languageconst.enter.tr,
                            ),
                          ),
                        ],
                      ),
                      heightY(10.h),
                      Row(
                        children: [
                          Expanded(
                            child: Datetimetextfield(
                                title: languageconst.ValidForm.tr,
                                hint: "DD/MM/YY",
                                onpressed: () async {
                                  final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2015),
                                      lastDate: selectedDate);
                                  if (picked != null &&
                                      picked != selectedDate) {
                                    setState(() {
                                      datecontrollrs.text =
                                          "${picked.toLocal()}".split(" ")[0];
                                      selectedDate = picked;
                                    });
                                  }
                                }),
                          ),
                          widthX(10.w),
                          Expanded(
                            child: Datetimetextfield(
                                title: languageconst.ValidTill.tr,
                                hint: "DD/MM/YY",
                                onpressed: () async {
                                  final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2015),
                                      lastDate: selectedDate);
                                  if (picked != null &&
                                      picked != selectedDate) {
                                    setState(() {
                                      datecontrollrs.text =
                                          "${picked.toLocal()}".split(" ")[0];
                                      selectedDate = picked;
                                    });
                                  }
                                }),
                          ),
                        ],
                      ),
                      heightY(15.h),
                      Text(
                        languageconst.UsageBenifits.tr,
                        style: manageData.appTextTheme.fs16Normal
                            .copyWith(color: manageData.appColors.gray),
                      ),
                      heightY(10.h),
                      Row(
                        children: [
                          Expanded(
                            child: Textfieldwithtitle(
                              title: languageconst.TotalUsers.tr,
                              hint: languageconst.enter.tr,
                            ),
                          ),
                          widthX(10.w),
                          Expanded(
                            child: Textfieldwithtitle(
                              title: languageconst.UsesperCustomer.tr,
                              hint: languageconst.enter.tr.tr,
                            ),
                          ),
                        ],
                      ),
                      heightY(10.h),
                      offerType == "Tiered Discount"
                          ? TieredDiscount()
                          : SizedBox(),
                      offerType == "Bundle Discount"
                          ? Column(
                              children: [
                                Primarydropdownbutton_widget(
                                  hint: languageconst.bundleType.tr,
                                  selectedValue: _offervalue,
                                  dropdownItems: Localdata.bundleType,
                                  title: languageconst.bundleType.tr,
                                  onChanged: (v) {},
                                ),
                              ],
                            )
                          : SizedBox(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
