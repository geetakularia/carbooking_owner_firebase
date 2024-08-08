import 'package:car_booking_owner/Components/AppTiles/BookingCarTile.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});
  final List<String> items = [
    languageconst.New.tr,
    languageconst.upcoming.tr,
    languageconst.completed.tr
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    var manageData2 = manageData;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: 0.w, left: 15.h, right: 15.h, top: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                languageconst.booking.tr,
                style: manageData2.appTextTheme.fs24Normal,
              ),
              heightY(15.h),
              Row(
                children: [
                  Expanded(
                      child: Primary_txtField(
                          hint_txt: languageconst.searchForRentalAndCars.tr)),
                  widthX(15.w),
                  SizedBox(
                    height: 51.h,
                    child: PopupMenuButton<String>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0.r),
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      icon: Container(
                        height: 75.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                            color: manageData.appColors.white,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Icon(
                          Icons.filter_list,
                          color: manageData.appColors.primary,
                          // size: 30,
                        ),
                      ),
                      color: Colors.white,
                      itemBuilder: (context) => List.generate(
                        items.length,
                        (index) {
                          final item = items[index];
                          return PopupMenuItem<String>(
                            value: item,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item),
                                selectedValue == item
                                    ? SvgPicture.asset(
                                        manageData.appsvgimg.payment,
                                        color: manageData.appColors.primary,
                                      )
                                    : SizedBox(),
                              ],
                            ),
                            onTap: () {
                              // Handle item selection
                              selectedValue = item;
                            },
                          );
                        },
                      ),
                      onSelected: (String value) {
                        selectedValue = value; // Update selectedValue
                      },
                    ),
                  ),
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
                        childAspectRatio: 1.7,
                        crossAxisCount: 1),
                    itemBuilder: (context, index) {
                      return BookingsCarTile();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
