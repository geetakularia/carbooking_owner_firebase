import 'package:car_booking_owner/Controllers/BookingController.dart';
import 'package:car_booking_owner/Controllers/CarController.dart';
import 'package:car_booking_owner/Controllers/CouponController.dart';
import 'package:car_booking_owner/Controllers/OfferController.dart';
import 'package:car_booking_owner/Controllers/user_controller.dart';
import 'package:car_booking_owner/I18n/LanguageController.dart';
import 'package:get/get.dart';

class AppInitialbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(LanguageController());
    // Get.put(CarController());
    Get.put(OfferController());
    Get.put(CarController());
    // Get.put(packagecontroller());
    Get.put(BookingController());
    Get.put(CouponController());
  }
}
