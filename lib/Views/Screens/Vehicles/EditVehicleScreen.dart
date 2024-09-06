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
import 'package:car_booking_owner/Models/carmodel.dart';
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
  final carcontroller = Get.find<FirebaseController>();
  bool isAvailableSelected = false;
  bool isUnavailableSelected = false;
  @override
  void initState() {
    super.initState();
    getfun();
  }

  getfun() {
    final carcontroller = Get.find<FirebaseController>();
    final id = Get.arguments["car_id"];
    final dataId = carcontroller.getallcars
        .firstWhere((e) => e.car_id == id, orElse: () => Car_model());
    _platenumber.text = dataId.platenumber!;
    _carmakeValue = dataId.companyname!;
    _carmodelValue = dataId.carmodel!;
    _transmissionValue = dataId.transmission!;
    _seatingcapacityValue = dataId.seatingcapacity!;
    _fuelValue = dataId.fuel!;
    _categoryValue = dataId.category!;
    _yearValue = dataId.manufactureyear!;
    _description.text = dataId.description!;
    _packagetypevalue = dataId.createpackagedata!.first.packagetype!;
    _ammount.text = dataId.createpackagedata!.first.ammount!.toString();
    initialvalue = dataId.carstatus.toString().obs;
  }

  Widget build(BuildContext context) {
    // print("-=-=-=-=-=-=-${carcontroller.car.companyname}---------");
    final id = Get.arguments["car_id"];
    print(id);
    final data = carcontroller.getallcars
        .firstWhere((e) => e.car_id == id, orElse: () => Car_model());
    return Scaffold(
      appBar: AppBar(
        title: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: data.carmodel,
              style: manageData.appTextTheme.fs24Normal
                  .copyWith(color: manageData.appColors.black)),
          TextSpan(
              text: " ( ${data.manufactureyear} ) ",
              style: manageData.appTextTheme.fs16Normal
                  .copyWith(color: manageData.appColors.black))
        ])),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: PrimaryButton(
            title: languageconst.saveChanges.tr,
            onPressed: () {
              Car_model updatecardata = data.copyWith(
                  carstatus: initialvalue.toString(),
                  car_id: id,
                  companyname: _carmakeValue,
                  carmodel: _carmodelValue,
                  platenumber: _platenumber.text.trim(),
                  transmission: _transmissionValue,
                  seatingcapacity: _seatingcapacityValue,
                  fuel: _fuelValue,
                  category: _categoryValue,
                  manufactureyear: _yearValue,
                  description: _description.text.trim(),
                  packagetype: _packagetypevalue,
                  ammount: double.tryParse(_ammount.text.trim()));

              carcontroller.updateVehicle(id, updatecardata.toAddvehicle());
            }),
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
                    hint: data.companyname.toString(),
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
                    hint: data.carmodel.toString(),
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
                  hint_txt: "",
                  suffixicon: Icons.done,
                ),
                heightY(10.h),
                Primarydropdownbutton_widget(
                    hint: data.transmission.toString(),
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
                          hint: data.seatingcapacity.toString(),
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
                          hint: data.fuel.toString(),
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
                          hint: data.category.toString(),
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
                          hint: data.manufactureyear.toString(),
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
                  controller: _description,
                  hint: data.description.toString(),
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
                          hint: data.createpackagedata!
                              .map(
                                (e) => e.packagetype,
                              )
                              .toString(),
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
                          hint_txt: data.createpackagedata!
                              .map(
                                (e) => e.ammount,
                              )
                              .toString(),
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
                                // carcontroller.updateStatus(v);
                                if (initialvalue.isNotEmpty) {
                                  initialvalue(v);
                                }
                                if (initialvalue.isEmpty) {
                                  initialvalue(v);
                                } else {
                                  initialvalue("");
                                }
                              },
                              value: initialvalue.value),
                        ),
                        Expanded(
                          child: CheckBoxListTile_widget(
                              title: languageconst.unavailable.tr,
                              onChanged: (v) {
                                if (initialvalue.isNotEmpty) {
                                  initialvalue(v);
                                }
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
