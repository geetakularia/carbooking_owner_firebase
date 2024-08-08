import 'package:car_booking_owner/Components/AppTiles/ReviewsTile.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Res/Services/app_services.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          languageconst.reviews.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Expanded(
            child: ListView.separated(
              clipBehavior: Clip.none,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => heightY(15.h),
              itemCount: 5,
              itemBuilder: (context, index) {
                return ReviewsTle();
              },
            ),
          ),
        ),
      ),
    );
  }
}
