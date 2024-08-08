import 'package:car_booking_owner/Components/AppTiles/RentalCars.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RentalCarSeeAllScreen extends StatelessWidget {
  const RentalCarSeeAllScreen({super.key});

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
          scrollDirection: Axis.vertical, padding: EdgeInsets.all(10.0.sp),
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
    );
  }
}
