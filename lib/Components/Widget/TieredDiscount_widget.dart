import 'package:car_booking_owner/Components/Text_field/Datetimetextfield.dart';
import 'package:car_booking_owner/Components/Text_field/Textfieldwithtitle.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TieredDiscountScreen extends StatefulWidget {
  TextEditingController spendvalue,
      discountvalue,
      discountunit,
      validfrom,
      validtill;
  TieredDiscountScreen(
      {super.key,
      required this.discountunit,
      required this.discountvalue,
      required this.spendvalue,
      required this.validfrom,
      required this.validtill});

  @override
  State<TieredDiscountScreen> createState() => _TieredDiscountScreenState();
}

class _TieredDiscountScreenState extends State<TieredDiscountScreen> {
  bool showvaluecontainer = true;
  DateTime selectedDate = DateTime.now();

  final TextEditingController datecontrollrs = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        showvaluecontainer
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(languageconst.SpendThreshold.tr,
                          style: manageData.appTextTheme.fs16Normal),
                      InkWell(
                          onTap: () {
                            setState(() {
                              showvaluecontainer = !showvaluecontainer;
                            });
                          },
                          child: SvgPicture.asset(
                              manageData.appsvgimg.spendthreshold))
                    ],
                  ),
                  heightY(10.h),
                  Text(
                    languageconst.Benefits.tr,
                    style: manageData.appTextTheme.fs16Normal
                        .copyWith(color: manageData.appColors.gray),
                  ),
                  heightY(10.h),
                  Textfieldwithtitle(
                    keyboardtype: TextInputType.number,
                    controller: widget.spendvalue,
                    title:
                        "${languageconst.SpendThreshold.tr} (${languageconst.minimumspentvalue.tr})",
                    hint: "₹0.0",
                  ),
                  heightY(10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Textfieldwithtitle(
                          keyboardtype: TextInputType.number,
                          controller: widget.discountvalue,
                          title: "${languageconst.DiscountValue.tr} ",
                          hint: "₹0.0",
                        ),
                      ),
                      widthX(10.w),
                      Expanded(
                        child: Textfieldwithtitle(
                          keyboardtype: TextInputType.number,
                          controller: widget.discountunit,
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
                            readOnly: true,
                            controller: widget.validfrom,
                            title: languageconst.ValidForm.tr,
                            hint: "DD/MM/YY",
                            onpressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  widget.validfrom.text =
                                      "${pickedDate.toLocal()}".split(' ')[0];
                                });
                              }
                            }),
                      ),
                      widthX(10.w),
                      Expanded(
                        child: Datetimetextfield(
                            readOnly: true,
                            controller: widget.validtill,
                            title: languageconst.ValidTill.tr,
                            hint: "DD/MM/YY",
                            onpressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  widget.validtill.text =
                                      "${pickedDate.toLocal()}".split(' ')[0];
                                });
                              }
                            }),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(languageconst.SpendThreshold.tr,
                      style: manageData.appTextTheme.fs16Normal),
                  InkWell(
                      onTap: () {
                        setState(() {
                          showvaluecontainer = !showvaluecontainer;
                        });
                      },
                      child: Icon(Icons.add))
                ],
              ),
        // : Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "After adding values ( preview ) ",
        //         style: manageData.appTextTheme.fs20Medium,
        //       ),
        //       heightY(7.h),
        //       Align(
        //           alignment: Alignment.topRight,
        //           child: GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   showvaluecontainer = !showvaluecontainer;
        //                 });
        //               },
        //               child: Icon(Icons.cancel_rounded))),
        //       heightY(10.h),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 languageconst.MinimumSpend.tr,
        //                 style: manageData.appTextTheme.fs14Normal,
        //               ),
        //               Text(
        //                 "₹400",
        //                 style: manageData.appTextTheme.fs16Normal,
        //               ),
        //             ],
        //           ),
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 languageconst.discount.tr,
        //                 style: manageData.appTextTheme.fs14Normal,
        //               ),
        //               Text(
        //                 "10%",
        //                 style: manageData.appTextTheme.fs16Normal,
        //               ),
        //             ],
        //           ),
        //           Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               Text(
        //                 "01-01-2024",
        //                 style: manageData.appTextTheme.fs14Normal,
        //               ),
        //               Text(
        //                 "to",
        //                 style: manageData.appTextTheme.fs14Normal,
        //               ),
        //               Text(
        //                 "10-03-2024",
        //                 style: manageData.appTextTheme.fs14Normal,
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // heightY(10.h),
        // Align(
        //     alignment: Alignment.bottomRight,
        //     child: PrimaryButton(
        //         title: "Save",
        //         onPressed: () {
        //           setState(() {
        //             showvaluecontainer = !showvaluecontainer;
        //           });
        //         })),
      ]),
    );
  }
}
