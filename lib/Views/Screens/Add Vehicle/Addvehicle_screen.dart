import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/ClrDialog.dart';
import 'package:car_booking_owner/Components/Dropdownbutton/dropdown_widget.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Widget/Addrowicon_widget.dart';
import 'package:car_booking_owner/Controllers/CarController.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Localdata/Localdata.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Addvehicle_screen extends StatefulWidget {
  const Addvehicle_screen({super.key});

  @override
  State<Addvehicle_screen> createState() => _Addvehicle_screenState();
}

class _Addvehicle_screenState extends State<Addvehicle_screen> {
  String? _carmakeValue;
  String? _carmodelValue;
  String? _transmissionValue;
  String? _seatingcapacityValue;
  String? _fuelValue;
  String? _categoryValue;
  String? _yearValue;
  TextEditingController _plateNumber = TextEditingController();
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Color pickerColor = Color.fromARGB(255, 235, 19, 4);
  Color currentColor = Color(0xff443a49);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            PrimaryButton(
              title: languageconst.next.tr,
              onPressed: () {
                CarController().addcarData(add_data());
                Get.toNamed("/mercedesbenz_screen");
              },
              isExpanded: true,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leadingWidth: 40.w,
        title: Text(
          languageconst.addVehicle.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    languageconst.startWithVehicleBasicInfo.tr,
                    style: manageData.appTextTheme.fs14Normal
                        .copyWith(color: manageData.appColors.gray),
                  ),
                  heightY(10.h),
                  Primarydropdownbutton_widget(
                      hint: languageconst.chooseCarCompany.tr,
                      selectedValue: _carmakeValue,
                      dropdownItems: Localdata.carMakeItems,
                      title: languageconst.carMake.tr),
                  heightY(10.h),
                  Primarydropdownbutton_widget(
                      hint: languageconst.select.tr,
                      selectedValue: _carmodelValue,
                      dropdownItems: Localdata.carmodelItems,
                      title: languageconst.carModel.tr),
                  heightY(10.h),
                  Text(
                    languageconst.licensePlateNumber.tr,
                    style: manageData.appTextTheme.fs16Normal
                        .copyWith(color: manageData.appColors.primary),
                  ),
                  heightY(10.h),
                  Primary_txtField(
                    fillcolor: true,
                    controller: _plateNumber,
                    hint_txt: languageconst.enter.tr,
                    suffixicon: Icons.done,
                  ),
                  heightY(10.h),
                  Primarydropdownbutton_widget(
                      hint: languageconst.select.tr,
                      selectedValue: _transmissionValue,
                      dropdownItems: Localdata.transmissionItems,
                      title: languageconst.transmission.tr),
                  heightY(10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Primarydropdownbutton_widget(
                            hint: languageconst.select.tr,
                            selectedValue: _seatingcapacityValue,
                            dropdownItems: Localdata.seatingcapacityItems,
                            title: languageconst.seatingCapacity.tr),
                      ),
                      widthX(15.w),
                      Expanded(
                        child: Primarydropdownbutton_widget(
                            hint: languageconst.select.tr,
                            selectedValue: _fuelValue,
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
                            dropdownItems: Localdata.categoryItems,
                            title: languageconst.category.tr),
                      ),
                      widthX(15.w),
                      Expanded(
                        child: Primarydropdownbutton_widget(
                            hint: languageconst.select.tr,
                            selectedValue: _yearValue,
                            dropdownItems: Localdata.yearItems,
                            title: languageconst.manufactureYear.tr),
                      ),
                    ],
                  ),
                  heightY(12.h),
                  AddrowwithIcon_widget(
                      title: languageconst.addColorVariant.tr,
                      onpressed: () {
                        setState(() => currentColor = pickerColor);

                        Get.dialog(Dialog(child: ClrDialog()));
                      }),
                  heightY(15.h),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> add_data() {
    return Carmodel()
        .copywith(
            platenumber: _plateNumber.text.trim(),
            companyname: _carmakeValue, 
            carmodel: _carmodelValue,
            transmission: _transmissionValue,
            seatingcapacity: _seatingcapacityValue,
            fuel: _fuelValue,
            category: _categoryValue,
            manufactureyear: _yearValue)
        .tomap();
  }
}
