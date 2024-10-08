import 'package:car_booking_owner/Components/AppTiles/BookingCarTile.dart';
import 'package:car_booking_owner/Components/AppTiles/RentalCars.dart';
import 'package:car_booking_owner/Components/AppTiles/ReviewsTile.dart';
import 'package:car_booking_owner/Components/Custom_graph.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Widget/Car_box_widget.dart';
import 'package:car_booking_owner/Components/Widget/Icon_container_widget.dart';
import 'package:car_booking_owner/Controllers/BookingController.dart';
import 'package:car_booking_owner/Controllers/CarController.dart';
import 'package:car_booking_owner/Controllers/OfferController.dart';
import 'package:car_booking_owner/Controllers/user_controller.dart';
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
  final controllerdata = Get.find<CarController>();
  final OfferControllerdata = Get.find<OfferController>();
  final BookingControllerdata = Get.find<BookingController>();
  @override
  Widget build(BuildContext context) {
    // print("-=-=-=-=-=-=-=-=-=-=${BookingControllerdata.getbookingcar.}");
    return Scaffold(
        body: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(40.r)),
              color: manageData.appColors.primary),
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  usercontroller.userdata.data!.image!.isEmpty
                      ? Container(
                          padding: EdgeInsets.all(9.sp),
                          decoration: BoxDecoration(
                              color: manageData.appColors.gray,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.person,
                            color: manageData.appColors.white,
                            size: 30,
                          ))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            usercontroller.userdata.data!.image!,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                  // Container(
                  //   clipBehavior: Clip.antiAlias,
                  //   height: 60,
                  //   width: 60,
                  //   decoration: const BoxDecoration(shape: BoxShape.circle),
                  //   child: Image.asset(
                  //     manageData.appimage.girlprofile,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  widthX(14.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          usercontroller.userdata.data!.name.toString(),
                          style: manageData.appTextTheme.fs20Normal
                              .copyWith(color: manageData.appColors.white),
                        ),
                        Text(
                          usercontroller.userdata.data!.email.toString(),
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
                        print(
                            "------------${BookingControllerdata.getbookingcar.map(
                          (e) => e.bookingID,
                        )}===============");
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
                    items: OfferControllerdata.getofferdata.map(
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
                                        e.title.toString(),
                                        style:
                                            manageData.appTextTheme.fs20Normal,
                                      ),
                                      heightY(10.h),
                                      Text(
                                        e.description.toString(),
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
                                              text:
                                                  e.generalDiscount.toString(),
                                              style: manageData
                                                  .appTextTheme.fs16Normal
                                                  .copyWith(
                                                      color: Colors.black),
                                            ),
                                            // TextSpan(
                                            //   text: e["discount"],
                                            // )
                                          ]))
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        e.bannerimg!,
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
                      OfferControllerdata.getofferdata.length,
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
                /**************************** booking */
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
                /**************************** booking  cars*/
                AspectRatio(
                  aspectRatio: 1.7,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    separatorBuilder: (context, index) => widthX(10.w),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: BookingControllerdata.getbookingcar.length,
                    itemBuilder: (context, index) {
                      return Container(
                          width: AppServices.screenWidth(context) * 0.93,
                          child: BookingsCarTile(
                            onpressed: () {
                              Get.toNamed(RoutesName.BookingDetailsScreen,
                                  arguments: {
                                    "bookingID": BookingControllerdata
                                        .getbookingcar[index].bookingID
                                  });
                            },
                            model: BookingControllerdata.getbookingcar[index],
                          ));
                    },
                  ),
                ),
                heightY(15.h),
                //************************** vehicle */
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
                    itemCount: controllerdata.getallcars.length,
                    itemBuilder: (context, index) {
                      final data = controllerdata.getallcars[index];
                      return Container(
                          width: AppServices.screenWidth(context) * 0.52,
                          child: RentalCarTile(
                            onpressed: () {
                              Get.toNamed(RoutesName.CarPreviewScreen,
                                  arguments: {
                                    "car_id":
                                        controllerdata.getallcars[index].car_id
                                  });
                            },
                            model: data,
                          ));
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
