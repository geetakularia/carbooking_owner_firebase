import 'package:car_booking_owner/Components/constant/image.dart';
import 'package:car_booking_owner/Controllers/NotificationServices.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Views/Screens/Add%20Vehicle/Addvehicle_screen.dart';
import 'package:car_booking_owner/Views/Screens/Bookings/BookingScreen.dart';
import 'package:car_booking_owner/Views/Screens/Home/Home_screen.dart';
import 'package:car_booking_owner/Views/Screens/Vehicles/VehiclesScreen.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../Screens/Setting/Setting_screen/Setting_screen.dart';

// ignore: must_be_immutable
class BottomScreen extends StatefulWidget {
  int currentIndex;
  BottomScreen({super.key, this.currentIndex = 0});

  @override
  _BottomScreenState createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  @override
  void initState() {
    // print("init state :::");
    super.initState();
  
  }

  List<CustomRow> listOfBottom = [
    CustomRow(SvgImage().home, languageconst.home),
    CustomRow(SvgImage().booking_car, languageconst.bookings),
    CustomRow(SvgImage().home, ""),
    CustomRow(SvgImage().vehicles_img, languageconst.vehicles),
    CustomRow(SvgImage().setting_img, languageconst.settings),
  ];

  List<Widget> listOfScreens = [
    Home_screen(),
    BookingScreen(),
    Addvehicle_screen(),
    VehiclesScreen(),
    Setting_screen(),
  ];

  late int index = widget.currentIndex;
  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;

    return Scaffold(
        body: listOfScreens[index],
        bottomNavigationBar: BottomAppBar(
            height: 70,
            color: manageData.appColors.primary,
            shape: CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  listOfBottom.length,
                  (i) => i == 2
                      ? SizedBox(
                          width: 15,
                        )
                      : InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              index = i;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(children: [
                              SvgPicture.asset(
                                listOfBottom[i].image,
                              ),
                              heightY(5.h),
                              SizedBox(
                                width: 63.w,
                                child: Text(
                                  listOfBottom[i].name.tr,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: manageData.appTextTheme.fs14Normal
                                      .copyWith(
                                    color: index == i
                                        ? manageData.appColors.lightgreen
                                        : manageData.appColors.white,
                                  ),
                                ),
                              )
                            ]),
                          )),
                )
              ],
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: true,
        floatingActionButton: keyboardIsOpened
            ? null
            : InkWell(
                onTap: () {
                  Get.toNamed("/addvehicle");
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: manageData.appColors.gray, width: 5),
                      color: manageData.appColors.primary,
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.add,
                    color: manageData.appColors.white,
                  ),
                ),
              ));
  }
}

class CustomRow {
  String image, name;
  CustomRow(this.image, this.name);
}
