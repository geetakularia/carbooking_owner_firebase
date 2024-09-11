import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dropdownbutton/dropdown_widget.dart';
import 'package:car_booking_owner/Components/Text_field/Datetimetextfield.dart';
import 'package:car_booking_owner/Components/Text_field/Descriptiontextfield.dart';
import 'package:car_booking_owner/Components/Text_field/Textfieldwithtitle.dart';
import 'package:car_booking_owner/Components/Widget/AddOfferdetail.dart';
import 'package:car_booking_owner/Components/Widget/TieredDiscount_widget.dart';
import 'package:car_booking_owner/Controllers/OfferController.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Localdata/Localdata.dart';
import 'package:car_booking_owner/Models/OfferModel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
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
  /********* */
  // final _datecontrollrs = TextEditingController();
  final _discountvalue = TextEditingController();
  final _discountunit = TextEditingController();
  final _totaluser = TextEditingController();
  final _totaluses = TextEditingController();
  final _title = TextEditingController();
  final _couponcode = TextEditingController();
  final _description = TextEditingController();
  final _datefrom = TextEditingController();
  final _datetill = TextEditingController();
  /******** */
  final _tieredspendvalue = TextEditingController();
  final _tiereddiscountvalue = TextEditingController();
  final _tiereddiscountunit = TextEditingController();
  final _tieredvaildfrom = TextEditingController();
  final _tieredvaildtill = TextEditingController();

  /******** */
  String offerType = Get.arguments.toString();
  final offerController = Get.find<OfferController>();
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
              onPressed: () {
                final addData = OfferDetails(
                    discountType: offerType,
                    bundleType: _offervalue,
                    generalDiscount: 77,
                    bannerimg: "image",
                    tieredDiscounts: [
                      TieredDiscount(
                          discountUnit: _tiereddiscountunit.text.trim(),
                          discountValue:
                              double.tryParse(_tieredspendvalue.text.trim()),
                          spendvalue:
                              double.tryParse(_tieredspendvalue.text.trim()))
                    ],
                    couponCode: _couponcode.text.trim(),
                    description: _description.text.trim(),
                    title: _title.text,
                    totalUsers: int.tryParse(_totaluser.text.trim()),
                    usesPerCustomer: int.tryParse(_totaluses.text.trim()),
                    benefitsmodel: [
                      Benefitsmodel(
                          validFrom: DateTime.now().toIso8601String(),
                          validTill: DateTime.now().toIso8601String(),
                          discountUnit: _discountunit.text.trim(),
                          discountValue:
                              double.tryParse(_discountvalue.text.trim()))
                    ]);
                offerController.addOffer(addData.toJson()).whenComplete(
                 () {
                    Get.toNamed(RoutesName.offer);
                  }, 
                );
              },
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
                            "₹100.0",
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
                      Thumbnail_Banner_widget(),
                      heightY(15.h),
                      Text(
                        "${languageconst.aboutdiscount.tr} ${"(%)"}",
                        style: manageData.appTextTheme.fs16Normal,
                      ),
                      heightY(15.h),
                      Textfieldwithtitle(
                        controller: _title,
                        title: languageconst.Title.tr,
                        hint: languageconst.enter.tr,
                      ),
                      heightY(15.h),
                      Textfieldwithtitle(
                        controller: _couponcode,
                        title: languageconst.couponCode.tr,
                        hint: languageconst.enterCodeHere.tr,
                      ),
                      heightY(15.h),
                      Descriptiontextfield(
                          controller: _description,
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
                              controller: _discountvalue,
                              title: languageconst.DiscountValue.tr,
                              hint: "₹0.0",
                            ),
                          ),
                          widthX(10.w),
                          Expanded(
                            child: Textfieldwithtitle(
                              controller: _discountunit,
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
                                controller: _datefrom,
                                title: languageconst.ValidForm.tr,
                                hint: "DD/MM/YY",
                                onpressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null) {
                                    setState(() {
                                      _datefrom.text = "${pickedDate.toLocal()}"
                                          .split(' ')[0];
                                    });
                                  }
                                }),
                          ),
                          widthX(10.w),
                          Expanded(
                            child: Datetimetextfield(
                                controller: _datetill,
                                title: languageconst.ValidTill.tr,
                                hint: "DD/MM/YY",
                                onpressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null) {
                                    setState(() {
                                      _datetill.text = "${pickedDate.toLocal()}"
                                          .split(' ')[0];
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
                              controller: _totaluser,
                              title: languageconst.TotalUsers.tr,
                              hint: languageconst.enter.tr,
                            ),
                          ),
                          widthX(10.w),
                          Expanded(
                            child: Textfieldwithtitle(
                              controller: _totaluses,
                              title: languageconst.UsesperCustomer.tr,
                              hint: languageconst.enter.tr.tr,
                            ),
                          ),
                        ],
                      ),
                      heightY(10.h),
                      offerType == "Tiered Discount"
                          ? TieredDiscountScreen(
                              discountunit: _tiereddiscountunit,
                              discountvalue: _tiereddiscountvalue,
                              spendvalue: _tieredspendvalue,
                              validfrom: _tieredvaildfrom,
                              validtill: _tieredvaildtill,
                            )
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
