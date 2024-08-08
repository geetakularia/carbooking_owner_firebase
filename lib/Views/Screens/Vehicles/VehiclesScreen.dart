import 'package:car_booking_owner/Components/AppTiles/RentalCars.dart';
import 'package:car_booking_owner/Components/Buttons/SimpleButton.dart';
import 'package:car_booking_owner/Components/Dialog/VehiclesFilter_dialog.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: 0.w, left: 15.h, right: 15.h, top: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // heightY(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: languageconst.vehicles.tr,
                      style: manageData.appTextTheme.fs24Normal
                          .copyWith(color: Colors.black),
                    ),
                    TextSpan(
                      text: " (120)",
                      style: manageData.appTextTheme.fs14Normal
                          .copyWith(color: Colors.black),
                    )
                  ])),
                  SimpleButton(
                      title: languageconst.addCars.tr,
                      onPressed: () {
                        Get.toNamed(RoutesName.addvehicle);
                      }),
                ],
              ),
              heightY(15.h),
              Row(
                children: [
                  Expanded(
                      child: Primary_txtField(
                          hint_txt: languageconst.searchForRentalAndCars.tr)),
                  widthX(15.w),

                  /************ dropdown */
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 13.h),
                      decoration: BoxDecoration(
                          color: manageData.appColors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Icon(Icons.filter_list),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return FilterDialog();
                        },
                      );
                    },
                  )
                ],
              ),
              heightY(15.h),
              ScrollConfiguration(
                behavior: ScrollBehavior().copyWith(overscroll: false),
                child: Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 18,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.9,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return RentalCarTile();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
