import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Localdata/Localdata.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({super.key});

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  CarouselSliderController carouselController = CarouselSliderController();
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: manageData.appColors.white,
      body: Column(
        children: [
          ClipPath(
            clipper: Waveclipper(),
            child: CarouselSlider(
                carouselController: carouselController,
                items: Localdata.onboardingitems
                    .map(
                      (e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                e.image,
                                width: AppServices.screenWidth(context),
                                fit: BoxFit.cover,
                              ),
                              Text("nbvfngm,ugjhfggk"),
                              Positioned(
                                bottom: 100,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  e.name,
                                  style: manageData.appTextTheme.fs26Normal
                                      .copyWith(
                                          color: manageData.appColors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  enlargeCenterPage: false,
                  aspectRatio: 0.64,
                  viewportFraction: 1,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentindex = index;
                    });
                  },
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Localdata.onboardingitems[currentindex].title,
                  style: manageData.appTextTheme.fs22Normal,
                ),
                heightY(10.h),
                Text(
                  Localdata.onboardingitems[currentindex].description,
                  style: manageData.appTextTheme.fs16Normal
                      .copyWith(color: manageData.appColors.gray),
                ),
                heightY(23.sp),
                currentindex == 2
                    ? Row(
                        children: [
                          PrimaryButton(
                              isExpanded: true,
                              title: "Get Started",
                              onPressed: () {
                                Get.offAllNamed("/login_screen");
                              }),
                        ],
                      )
                    : Row(
                        children: [
                          PrimaryButton(
                            backGroundTransparent: true,
                            title: languageconst.next.tr,
                            onPressed: () {
                              currentindex == 2
                                  ? Get.toNamed("/login_screen")
                                  : carouselController.nextPage();
                            },
                            isExpanded: true,
                          ),
                          widthX(20.w),
                          PrimaryButton(
                              isExpanded: true,
                              title: languageconst.Skip.tr,
                              onPressed: () {
                                Get.offAllNamed("/login_screen");
                              }),
                        ],
                      ),
                heightY(23.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      Localdata.onboardingitems.length,
                      (index) {
                        return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.r),
                                color: currentindex == index
                                    ? manageData.appColors.primary
                                    : manageData.appColors.gray),
                            height: 6.h,
                            width: currentindex == index ? 20.w : 8.w,
                            margin: const EdgeInsets.only(
                              right: 5,
                            ));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Waveclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.70);
    var firstlinestart = Offset(size.width * 0.06, size.height);
    var firstlineend = Offset(size.width * 0.5, size.height * 0.9);
    path.quadraticBezierTo(
        firstlinestart.dx, firstlinestart.dy, firstlineend.dx, firstlineend.dy);
    var secondlinestart = Offset(size.width * 1.04, size.height * 0.8);
    var secondlineend = Offset(size.width, size.height * 1.04);
    path.quadraticBezierTo(secondlinestart.dx, secondlinestart.dy,
        secondlineend.dx, secondlineend.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
