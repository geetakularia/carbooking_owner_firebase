import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/CheckBox/checkBoxListTile.dart';
import 'package:car_booking_owner/Components/Dialog/ClrDialog.dart';
import 'package:car_booking_owner/Components/Dropdownbutton/dropdown_widget.dart';
import 'package:car_booking_owner/Components/Text_field/Descriptiontextfield.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Widget/Addrowicon_widget.dart';
import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Localdata/Localdata.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditVehiclesScreen extends StatefulWidget {
  EditVehiclesScreen({super.key});

  @override
  State<EditVehiclesScreen> createState() => _EditVehiclesScreenState();
}

class _EditVehiclesScreenState extends State<EditVehiclesScreen> {
  String? _carmakeValue;
  String? _carmodelValue;
  String? _transmissionValue;
  String? _seatingcapacityValue;
  String? _fuelValue;
  String? _categoryValue;
  String? _yearValue;
  String? _packagetypevalue;

  RxString initialvalue = "".obs;
  final _platenumber = TextEditingController();
  final _description = TextEditingController();
  final _ammount = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _getdata();
  }

  // _getdata() {
  //   final carcontroller = Get.find<FirebaseController>().getallcars.map((e) => e.car_id==);

  //   _carmakeValue = carcontroller.car.companyname;
  //   _carmodelValue = carcontroller.car.carmodel;
  //   _platenumber.text = carcontroller.car.platenumber!;
  //   _transmissionValue = carcontroller.car.transmission;
  //   _fuelValue = carcontroller.car.fuel;
  //   _seatingcapacityValue = carcontroller.car.seatingcapacity;
  //   _categoryValue = carcontroller.car.category;
  //   _yearValue = carcontroller.car.manufactureyear;
  //   _description.text = carcontroller.car.description!;
  //   _packagetypevalue = carcontroller.car.packagetype;
  //   _ammount.text = carcontroller.car.ammount!.toString();
  //   setState(() {});
  // }

  Widget build(BuildContext context) {
    final carcontroller = Get.find<FirebaseController>();
    print("-=-=-=-=-=-=-${carcontroller.car.companyname}---------");
    return Scaffold(
      appBar: AppBar(
        title: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Toyota Innova",
              style: manageData.appTextTheme.fs24Normal
                  .copyWith(color: manageData.appColors.black)),
          TextSpan(
              text: " ( 2023 )",
              style: manageData.appTextTheme.fs16Normal
                  .copyWith(color: manageData.appColors.black))
        ])),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: PrimaryButton(
            title: languageconst.saveChanges.tr, onPressed: () {}),
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Container(
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
                  languageconst.letstartvehiclebasic.tr,
                  style: manageData.appTextTheme.fs14Normal
                      .copyWith(color: manageData.appColors.gray),
                ),
                heightY(10.h),
                Primarydropdownbutton_widget(
                    hint: languageconst.chooseCarCompany.tr,
                    selectedValue: _carmakeValue,
                    onChanged: (v) {
                      setState(() {
                        _carmakeValue = v;
                      });
                    },
                    dropdownItems: Localdata.carMakeItems,
                    title: languageconst.carMake.tr),
                heightY(10.h),
                Primarydropdownbutton_widget(
                    hint: languageconst.select.tr,
                    selectedValue: _carmodelValue,
                    dropdownItems: Localdata.carmodelItems,
                    onChanged: (v) {
                      setState(() {
                        _carmodelValue = v;
                      });
                    },
                    title: languageconst.carModel.tr),
                heightY(10.h),
                Text(
                  languageconst.licensePlateNumber.tr,
                  style: manageData.appTextTheme.fs16Normal
                      .copyWith(color: manageData.appColors.primary),
                ),
                heightY(10.h),
                Primary_txtField(
                  controller: _platenumber,
                  fillcolor: true,
                  hint_txt: languageconst.enter.tr,
                  suffixicon: Icons.done,
                ),
                heightY(10.h),
                Primarydropdownbutton_widget(
                    hint: languageconst.select.tr,
                    selectedValue: _transmissionValue,
                    onChanged: (v) {
                      setState(() {
                        _transmissionValue = v;
                      });
                    },
                    dropdownItems: Localdata.transmissionItems,
                    title: languageconst.transmission.tr),
                heightY(10.h),
                Row(
                  children: [
                    Expanded(
                      child: Primarydropdownbutton_widget(
                          hint: languageconst.select.tr,
                          selectedValue: _seatingcapacityValue,
                          onChanged: (v) {
                            setState(() {
                              _seatingcapacityValue = v;
                            });
                          },
                          dropdownItems: Localdata.seatingcapacityItems,
                          title: languageconst.seatingCapacity.tr),
                    ),
                    widthX(15.w),
                    Expanded(
                      child: Primarydropdownbutton_widget(
                          hint: languageconst.select.tr,
                          selectedValue: _fuelValue,
                          onChanged: (v) {
                            setState(() {
                              _fuelValue = v;
                            });
                          },
                          dropdownItems: Localdata.fuelItems,
                          title: languageconst.fuel.tr),
                    ),
                  ],
                ),
                heightY(10.h),
                Row(
                  children: [
                    Expanded(
                      child: Primarydropdownbutton_widget(
                          hint: languageconst.selectCarCategory.tr,
                          selectedValue: _categoryValue,
                          onChanged: (v) {
                            setState(() {
                              _categoryValue = v;
                            });
                          },
                          dropdownItems: Localdata.categoryItems,
                          title: languageconst.category.tr),
                    ),
                    widthX(15.w),
                    Expanded(
                      child: Primarydropdownbutton_widget(
                          hint: languageconst.select.tr,
                          selectedValue: _yearValue,
                          onChanged: (v) {
                            setState(() {
                              _yearValue = v;
                            });
                          },
                          dropdownItems: Localdata.yearItems,
                          title: languageconst.manufactureYear.tr),
                    ),
                  ],
                ),
                heightY(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageconst.addColorVariant.tr,
                      style: manageData.appTextTheme.fs16Normal,
                    ),
                    GestureDetector(
                        onTap: () {
                          // setState(() => currentColor = pickerColor);

                          Get.dialog(
                              barrierDismissible: false,
                              Dialog(
                                child: ClrDialog(),
                              ));
                        },
                        child: SvgPicture.asset(manageData.appsvgimg.add))
                  ],
                ),
                heightY(10.h),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(manageData.appsvgimg.black),
                        widthX(5.w),
                        Text(
                          "Black",
                          style: manageData.appTextTheme.fs16Normal,
                        )
                      ],
                    ),
                    widthX(20.w),
                    Row(
                      children: [
                        SvgPicture.asset(manageData.appsvgimg.grey),
                        widthX(5.w),
                        Text(
                          "Grey",
                          style: manageData.appTextTheme.fs16Normal,
                        )
                      ],
                    )
                  ],
                ),
                /************************************************* */

                heightY(15.h),
                Descriptiontextfield(
                  hint: languageconst.writeCarIntro.tr,
                ),
                heightY(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageconst.editPackage.tr,
                      style: manageData.appTextTheme.fs16Normal,
                    ),
                    SvgPicture.asset(manageData.appsvgimg.add)
                  ],
                ),
                heightY(17.h),
                /************************** add and remove */
                Row(
                  children: [
                    Expanded(
                      child: Primarydropdownbutton_widget(
                          hint: "Per Hour",
                          selectedValue: _packagetypevalue,
                          onChanged: (v) {
                            setState(() {
                              _packagetypevalue = v;
                            });
                          },
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
                              .copyWith(color: manageData.appColors.primary),
                        ),
                        heightY(10.h),
                        Primary_txtField(
                          controller: _ammount,
                          hint_txt: "00.0",
                          fillcolor: true,
                        ),
                      ],
                    )),
                    widthX(15.w),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.all(12.sp),
                      decoration: BoxDecoration(
                          color: manageData.appColors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Icon(
                        Icons.delete_outlined,
                        color: manageData.appColors.red,
                        size: 30.sp,
                      ),
                    )
                  ],
                ),
                heightY(15.h),
                Text(
                  languageconst.showcases.tr,
                  style: manageData.appTextTheme.fs14Normal
                      .copyWith(color: manageData.appColors.gray),
                ),
                heightY(10.h),
                Divider(
                  thickness: 1,
                ),
                heightY(10.h),
                Text(
                  languageconst.thumbnail.tr,
                  style: manageData.appTextTheme.fs16Normal,
                ),
                heightY(10.h),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Stack(children: [
                      Image.asset(manageData.appimage.innova),
                      Positioned(
                          right: 10,
                          top: 10,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(3.sp),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    manageData.appColors.white.withOpacity(0.7),
                              ),
                              child: Icon(Icons.edit_outlined),
                            ),
                          )),
                    ])),
                heightY(15.h),
                AddrowwithIcon_widget(
                    title: languageconst.showcaseCarPhotos.tr,
                    onpressed: () {}),
                heightY(15.h),
                Container(
                    decoration: BoxDecoration(
                        color: manageData.appColors.bgclr,
                        borderRadius: BorderRadius.circular(10.r)),
                    padding: EdgeInsets.all(50.sp),
                    width: AppServices.screenWidth(context),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "${languageconst.noPhotoUploaded.tr}\n",
                              style: manageData.appTextTheme.fs14Normal
                                  .copyWith(color: manageData.appColors.red)),
                          TextSpan(
                              text: languageconst.addNow.tr,
                              style: manageData.appTextTheme.fs14Normal
                                  .copyWith(color: manageData.appColors.black)),
                        ]))),
                heightY(15.h),
                AddrowwithIcon_widget(
                    title: languageconst.showcaseCarVideos.tr,
                    onpressed: () {}),
                heightY(15.h),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Stack(children: [
                      Image.asset(manageData.appimage.innova),
                      Positioned(
                          right: 10,
                          top: 10,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(3.sp),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: manageData.appColors.white),
                              child: Icon(
                                Icons.close,
                              ),
                            ),
                          )),
                    ])),
                heightY(15.h),
                Text(
                  languageconst.availabilityStatus.tr,
                  style: manageData.appTextTheme.fs16Normal,
                ),
                Obx(
                  () {
                    return Row(
                      children: [
                        Expanded(
                          child: CheckBoxListTile_widget(
                              title: languageconst.available.tr,
                              onChanged: (v) {
                                if (initialvalue.isEmpty) {
                                  initialvalue(v);
                                } else {
                                  initialvalue("");
                                }
                                print(initialvalue);
                              },
                              value: initialvalue.value),
                        ),
                        Expanded(
                          child: CheckBoxListTile_widget(
                              title: languageconst.unavailable.tr,
                              onChanged: (v) {
                                if (initialvalue.isEmpty) {
                                  initialvalue(v);
                                } else {
                                  initialvalue("");
                                }
                                print(initialvalue);
                              },
                              value: initialvalue.value),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
