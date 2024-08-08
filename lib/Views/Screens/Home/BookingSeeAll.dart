import 'package:car_booking_owner/Components/AppTiles/BookingCarTile.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingSeeAllScreen extends StatelessWidget {
  const BookingSeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
           languageconst.recentBookings.tr,
            style: manageData.appTextTheme.fs24Normal,
          ),
        ),
        body: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(10.sp),
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
        ));
  }
}
