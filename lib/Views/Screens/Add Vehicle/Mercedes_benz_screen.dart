import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Text_field/Descriptiontextfield.dart';
import 'package:car_booking_owner/Components/Widget/CreatePackageWidget.dart';
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

class Mercedesbenz_screen extends StatefulWidget {
  const Mercedesbenz_screen({super.key});

  @override
  State<Mercedesbenz_screen> createState() => _Mercedesbenz_screenState();
}

class _Mercedesbenz_screenState extends State<Mercedesbenz_screen> {
  String? packagetypevalue;
  final _description = TextEditingController();
  final List<TextEditingController> _ammount = [];
  List<String?> _packagetype_value = [];
  /*********** */
  List<String> tiles = [];
  // add a new tile
  void addTile() {
    setState(() {
      if (tiles.length <= 2) {
        setState(() {
          tiles.add('Tile ${tiles.length + 1}');
          _ammount.add(TextEditingController());
          _packagetype_value.add(null);
        });
      } else {
        //  show a message when the limit is reached
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Maximum of 3 tiles reached!')),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    tiles.add('Package 1');
    _ammount.add(TextEditingController());
    _packagetype_value.add(null);
  }

  @override
  Widget build(BuildContext context) {
    final carController = Get.find<CarController>();
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 40.w,
          title: Text(
            "Mercedes Benz Q80 ( 2023 )",
            style: manageData.appTextTheme.fs24Normal,
          ),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  hint: "write something about  your car as Intro",
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
                        onTap: () {
                          addTile();
                        },
                        child: SvgPicture.asset(manageData.appsvgimg.add))
                  ],
                ),
                heightY(17.h),
                /***************** add till for Create new package */
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: tiles.length,
                  itemBuilder: (context, index) {
                    return CreatePackageWidget(
                        typeenum: PackageType.values[index],
                        ammount: _ammount[index],
                        deleteOnpressed: () {
                          setState(() {
                            tiles.removeAt(index);
                          });
                        },
                        onchanged: (v) {
                          setState(() {
                            _packagetype_value[index] = v;
                          });
                        },
                        dropdownItems: Localdata.packagedata,
                        selectedValue: packagetypevalue);
                  },
                ),

                Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Row(
                    children: [
                      PrimaryButton(
                        title: languageconst.continueButton.tr,
                        onPressed: () async {
                          final PackageType type;
                          if (_packagetype_value == "Per Hour") {
                            type = PackageType.HOUR;
                          } else if (_packagetype_value == "Per Day") {
                            type = PackageType.DAY;
                          } else {
                            type = PackageType.WEEK;
                          }
                          final data = carController.car.copyWith(
                              description: _description.text.trim(),
                              createpackagedata: [
                                for (var i = 0; i < tiles.length; i++)
                                  CreatePackageModel(
                                    type: type,
                                    ammount:
                                        int.tryParse(_ammount[i].text.trim()),
                                    packagetype: _packagetype_value[i],
                                  ),
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
                // heightY(20.h),
              ],
            ),
          ),
        ])));
  }
}
