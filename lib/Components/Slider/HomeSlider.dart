import 'package:car_booking_owner/Models/Wedding_Model.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



// ignore: must_be_immutable
class HomeSlider extends StatelessWidget {
  WeddingModel getdata;
  HomeSlider({super.key,required this.getdata});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: manageData.appColors.white),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getdata.title,
                    style: manageData.appTextTheme.fs20Normal,
                  ),
                  heightY(10),
                  Text(
                    getdata.subtitle,
                    style: manageData.appTextTheme.fs14Normal
                        .copyWith(color: manageData.appColors.gray),
                  ),
                  heightY(10.h),
                  Text(
                    "Starting from",
                    style: manageData.appTextTheme.fs12Normal,
                  ),
                  RichText(
                      text: TextSpan(
                          style: manageData.appTextTheme.fs12Normal
                              .copyWith(color: Colors.black),
                          children: [
                        TextSpan(
                          text: getdata.ammount,
                          style: manageData.appTextTheme.fs16Normal
                              .copyWith(color: Colors.black),
                        ),
                        TextSpan(
                          text: getdata.discount,
                        )
                      ]))
                ],
              ),
            ),
          ),
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(12),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(12)),
                  child: Image.asset(
                    getdata.img,
                    height: AppServices.screenHeight(context),
                    fit: BoxFit.cover,
                  )))
        ],
      ),
    );
  }
}
