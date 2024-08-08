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

  navigatorcontext() {
    Future.delayed(
      Duration(seconds: 2),
      () => Get.toNamed("/onboarding"),
    );
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
