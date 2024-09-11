import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/Views/Screens/Vehicles/ImageShowScreen.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PhotovideoScreen extends StatefulWidget {
  const PhotovideoScreen({super.key});

  @override
  State<PhotovideoScreen> createState() => _PhotovideoScreenState();
}

class _PhotovideoScreenState extends State<PhotovideoScreen> {
  List<String> imagelist = [
    manageData.appimage.white_sports_car,
    manageData.appimage.innova,
    manageData.appimage.innova,
    manageData.appimage.innova,
    manageData.appimage.innova,
    manageData.appimage.innova,
    manageData.appimage.innova,
  ];
  @override
  Widget build(BuildContext context) {
    final controllerdata = Get.find<FirebaseController>();
    final id = Get.arguments["car_id"];
    final dataId = controllerdata.getallcars
        .firstWhere((e) => e.car_id == id, orElse: () => Car_model());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Photos",
          style: manageData.appTextTheme.fs18Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.builder(
                shrinkWrap: true,
                itemCount: dataId.image!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(ImageShowScreen(
                          image: dataId.image![index],
                          imageList: dataId.image!));
                    },
                    child: Image.network(
                      dataId.image![index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              heightY(15.h),
              Text(
                "Videos",
                style: manageData.appTextTheme.fs18Normal,
              ),
              heightY(15.h),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 150,
                    width: AppServices.screenWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      // color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(manageData
                            .appimage.innova), // Replace with your image URL
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      child: InkWell(
                          onTap: () {
                            Get.toNamed(RoutesName.VideoScreen);
                          },
                          child:
                              SvgPicture.asset(manageData.appsvgimg.playbtn))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
