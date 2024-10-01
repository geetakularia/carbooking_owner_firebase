import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Widget/Icon_container_widget.dart';
import 'package:car_booking_owner/Components/Widget/Notificationlistitle.dart';
import 'package:car_booking_owner/Controllers/NotificationServices.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Notification_screen extends StatefulWidget {
  const Notification_screen({super.key});

  @override
  State<Notification_screen> createState() => _Notification_screenState();
}

class _Notification_screenState extends State<Notification_screen> {
  NotificationServices noti = NotificationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    noti.requestNotificationPermission();
    noti.firebaseInit();
    noti.getDeviceToken().then(
      (value) {
        print(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          languageconst.notifications.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Primary_txtField(
                  hint_txt: languageconst.searchForMessages.tr,
                )),
                widthX(15.w),
                Iconcontainer(
                  icon: Icons.search,
                  onpressed: () {},
                )
              ],
            ),
            heightY(15.h),
            ScrollConfiguration(
              behavior: ScrollBehavior().copyWith(overscroll: false),
              child: Expanded(
                child: ListView.builder(
                  itemCount: 12,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Notificationlile_widget(
                    title: "Booking",
                    time: "1hr ago",
                    subtitle:
                        "Lorem ipsum dolor sit amet consectetur. Magna porttitor a cum sagittis eget ac in ",
                    manageData: manageData,
                    image: manageData.appimage.girlprofile,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width - 80, 0);
    path.lineTo(size.width - 50, 50);
    path.lineTo(size.width, 50);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Waveclipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.8);
    path.quadraticBezierTo(0, 0, size.width * 0.35, size.height * 0.5);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
