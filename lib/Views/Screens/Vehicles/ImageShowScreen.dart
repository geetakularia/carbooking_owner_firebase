import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ImageShowScreen extends StatefulWidget {
  String image;
  final List<String> imageList;
  ImageShowScreen({
    super.key,
    required this.image,
    required this.imageList,
  });

  @override
  State<ImageShowScreen> createState() => _ImageShowScreenState();
}

class _ImageShowScreenState extends State<ImageShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: manageData.appColors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24.sp,
            color: manageData.appColors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          children: [
            InteractiveViewer(
              child: Image.asset(
                widget.image,
                fit: BoxFit.contain,
                width: AppServices.screenWidth(context),
                height: AppServices.screenHeight(context) * 0.7,
              ),
            ),
            Spacer(),
            SizedBox(
              height: 50.h,
              width: AppServices.screenWidth(context) * 0.7,
              child: ScrollConfiguration(
                behavior: ScrollBehavior().copyWith(overscroll: false),
                child: ListView.builder(
                  itemCount: widget.imageList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.image = widget.imageList[index];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      decoration: BoxDecoration(
                          border: widget.image == widget.imageList[index]
                              ? Border.all(
                                  color: manageData.appColors.white,
                                  width: 2,
                                )
                              : null,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          widget.imageList[index],
                          width: 50.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
