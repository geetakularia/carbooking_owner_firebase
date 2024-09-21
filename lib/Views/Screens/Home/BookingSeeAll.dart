import 'package:car_booking_owner/Components/AppTiles/BookingCarTile.dart';
import 'package:car_booking_owner/Controllers/BookingController.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingSeeAllScreen extends StatelessWidget {
  const BookingSeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingcontrollerdata = Get.find<BookingController>();
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
            itemCount: bookingcontrollerdata.getbookingcar.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.7,
                crossAxisCount: 1),
            itemBuilder: (context, index) {
              return BookingsCarTile(
                onpressed: () {
                  Get.toNamed(RoutesName.BookingDetailsScreen, arguments: {
                    "bookingID":
                        bookingcontrollerdata.getbookingcar[index].bookingID
                  });
                },
                model: bookingcontrollerdata.getbookingcar[index],
              );
            },
          ),
        ));
  }
}
