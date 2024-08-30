import 'package:car_booking_owner/Components/AppTiles/BookingCarTile.dart';
import 'package:car_booking_owner/Components/AppTiles/RentalCars.dart';
import 'package:car_booking_owner/Components/AppTiles/ReviewsTile.dart';
import 'package:car_booking_owner/Components/Custom_graph.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Widget/Car_box_widget.dart';
import 'package:car_booking_owner/Components/Widget/Icon_container_widget.dart';
import 'package:car_booking_owner/Controllers/user_controller.dart';
import 'package:car_booking_owner/Functions/stream_function.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Localdata/Localdata.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  int currentindex = 0;
  final usercontroller = Get.find<UserController>();
  final stream = StreamFunction().streamdata();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(40)),
              color: manageData.appColors.primary),
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      manageData.appimage.girlprofile,
                      fit: BoxFit.cover,
                    ),
                  ),
                  widthX(14.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          usercontroller.userdata.data!.username,
                          style: manageData.appTextTheme.fs20Normal
                              .copyWith(color: manageData.appColors.white),
                        ),
                        Text(
                          usercontroller.userdata.data!.email,
                          style: manageData.appTextTheme.fs14Normal
                              .copyWith(color: manageData.appColors.white),
                        )
                      ],
                    ),
                  ),
                  widthX(14.w),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RoutesName.notification);
                    },
                    child: Icon(
                      Icons.notifications_none,
                      color: manageData.appColors.white,
                    ),
                  )
                ],
              ),
              Transform(
                transform: Matrix4.translationValues(0, 20, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Primary_txtField(
                        hint_txt: languageconst.searchForRentalAndCars.tr,
                        // isDense: false,
                      ),
                    ),
                    widthX(10.w),
                    Iconcontainer(
                      onpressed: () {
                        // Get.to(TestingScreen());
                      },
                      icon: Icons.search,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        heightY(25.h),
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(overscroll: false),
            child: ListView(
              // clipBehavior: Clip.none,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
              children: [
                heightY(15.h),
                SizedBox(
                  // aspectRatio: 2.48,
                  height: AppServices.screenHeight(context) * 0.1,
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    separatorBuilder: (context, index) => widthX(15.w),
                    shrinkWrap: true,
                    itemCount: Localdata.car_data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      final data = Localdata.car_data;
                      return CarBoxWidget(
                          totalbooking: data[i]["car"],
                          numberofcar: data[i]["ammount"]);
                    },
                  ),
                ),
                heightY(15.h),
                //*********************** wedding slider */
                CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: false,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentindex = index;
                        });
                      },
                    ),
                    items: Localdata.homeslideritems.map(
                      (e) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: manageData.appColors.white),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e["title"],
                                        style:
                                            manageData.appTextTheme.fs20Normal,
                                      ),
                                      heightY(10.h),
                                      Text(
                                        e["subtitle"],
                                        style: manageData
                                            .appTextTheme.fs14Normal
                                            .copyWith(
                                                color: manageData
                                                    .appColors.primary),
                                      ),
                                      heightY(10.h),
                                      Text(
                                        "Starting from",
                                        style:
                                            manageData.appTextTheme.fs12Normal,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              style: manageData
                                                  .appTextTheme.fs12Normal
                                                  .copyWith(
                                                      color: Colors.black),
                                              children: [
                                            TextSpan(
                                              text: e["rupess"],
                                              style: manageData
                                                  .appTextTheme.fs16Normal
                                                  .copyWith(
                                                      color: Colors.black),
                                            ),
                                            TextSpan(
                                              text: e["discount"],
                                            )
                                          ]))
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.asset(
                                        e["image"],
                                        height:
                                            AppServices.screenHeight(context),
                                        fit: BoxFit.cover,
                                      )))
                            ],
                          ),
                        );
                      },
                    ).toList()),
                heightY(15.h),
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
                                    : manageData.appColors.lightgray),
                            height: 6.h,
                            width: currentindex == index ? 20.w : 8.w,
                            margin: const EdgeInsets.only(
                              right: 5,
                            ));
                      },
                    )
                  ],
                ),
                heightY(15.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    languageconst.revenueGraph.tr,
                    style: manageData.appTextTheme.fs16Normal,
                  ),
                ),
                heightY(15.h),
                LineChartSample2(),
                heightY(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageconst.recentBookings.tr,
                      style: manageData.appTextTheme.fs16Normal,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.BookingSeeAllScreen);
                      },
                      child: Text(
                        languageconst.seeAll.tr,
                        style: manageData.appTextTheme.fs16Normal,
                      ),
                    ),
                  ],
                ),
                heightY(15.h),
                AspectRatio(
                  aspectRatio: 1.7,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    separatorBuilder: (context, index) => widthX(10.w),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                          width: AppServices.screenWidth(context) * 0.93,
                          child: BookingsCarTile());
                    },
                  ),
                ),
                heightY(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageconst.toprentalcar.tr,
                      style: manageData.appTextTheme.fs16Normal,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.RentalCarSeeAllScreen);
                      },
                      child: Text(
                        languageconst.seeAll.tr,
                        style: manageData.appTextTheme.fs16Normal,
                      ),
                    ),
                  ],
                ),
                heightY(15.h),
                AspectRatio(
                  aspectRatio: 1.8,
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    separatorBuilder: (context, index) => widthX(10.w),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                          width: AppServices.screenWidth(context) * 0.52,
                          child: RentalCarTile());
                    },
                  ),
                ),
                heightY(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageconst.reviews.tr,
                      style: manageData.appTextTheme.fs16Normal,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.ReviewScreen);
                      },
                      child: Text(
                        languageconst.seeAll.tr,
                        style: manageData.appTextTheme.fs16Normal,
                      ),
                    ),
                  ],
                ),
                heightY(15.h),
                SizedBox(
                  height: AppServices.screenHeight(context) * 0.18,
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => widthX(15.w),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ReviewsTle();
                    },
                  ),
                ),
                heightY(20.h),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
