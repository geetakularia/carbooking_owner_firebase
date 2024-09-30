import 'package:car_booking_owner/Controllers/BookingController.dart';
import 'package:car_booking_owner/Controllers/CarController.dart';
import 'package:car_booking_owner/Controllers/CouponController.dart';
import 'package:car_booking_owner/Controllers/OfferController.dart';
import 'package:car_booking_owner/Controllers/user_controller.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    navigatorcontext();
  }

  navigatorcontext() async {
    // Add each car model to Firebase
    // for (var carModel in carModels) {
    //   await addCarModelToFirebase(carModel);
    // }
    // await CarController();

    Future.delayed(Duration(milliseconds: 400), () async {
      await Get.find<UserController>().relogin();
      await Get.find<CarController>().getCars();
      await Get.find<OfferController>().getoffers();
      await Get.find<BookingController>().getCarsBooking();
      await Get.find<CouponController>().getcouponcode();
      // await Get.find<UserController>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: manageData.appColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SvgPicture.asset(manageData.appsvgimg.splash)],
        ),
      ),
    );
  }
}
