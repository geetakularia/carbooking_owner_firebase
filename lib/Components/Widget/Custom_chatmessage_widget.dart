import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MessageContain_widget extends StatelessWidget {
  MessageContain_widget({
    required this.isMe,
    required this.message,
    required this.time,
    required this.onPress,
    required this.index,
    required this.listLength,
    required this.isSeen,
    required this.type,
  });

  final bool isMe;
  final String message, type;
  final String time;
  final VoidCallback onPress;
  int index;
  int listLength;
  bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r),
                    bottomLeft: Radius.circular(20.r)),
                color: manageData.appColors.primary),
            child: Text(message.toString(),
                maxLines: 1,
                style: manageData.appTextTheme.fs14Normal
                    .copyWith(color: manageData.appColors.white)),
          ),
          Text(time.toString(),
              style: manageData.appTextTheme.fs12Normal
                  .copyWith(color: manageData.appColors.primary))
          // Gap(4),
        ],
      ),
    );
  }
}
