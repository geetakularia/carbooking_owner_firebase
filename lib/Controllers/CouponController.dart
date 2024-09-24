import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/Models/CouponCodeModel.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CouponController extends GetxController {
  final _function = FirebaseResponseHandler();
  List<CoupOnCodeModel> _coupon = [];
  List<CoupOnCodeModel> get getcoupon => _coupon;
  /****************************************** Create Coupon */
  Future<String?> addcoupon(Map<String, dynamic> model) async {
    String? couponId;
    try {
      print("-=-=-=-step1-=-=-=-=-");
      DocumentReference docRef = await manageData.api.coupondoc(couponId);
      final docid = docRef.id;
      model["couponId"] = docid;
      await _function.postData(docRef, model, RequestType.SET);
      final coupondata =
          CoupOnCodeModel.fromJson(FirebaseResponseModel(model, docid));
      _coupon.add(coupondata);
      print("-=-=-=-step2-=-=-=-=-");
    } catch (e) {
      print('Error adding coupon: $e');
      print("-=-=-=----------------------------------------------------------");
    } finally {
      update();
    }

    return couponId;
  }

  /****************************************** getcars Coupon */
  Future<void> getcouponcode() async {
    try {
      print("-------------------step1");
      final response = await _function.getDataFromFirebase(
          manageData.api.getcouponcollection) as List<FirebaseResponseModel>;
      if (response.isNotEmpty) {
        print("-------------------step2");
        final data = response.map((e) => CoupOnCodeModel.fromJson(e)).toList();
        // print("=========++++++++++++++======");
        _coupon = data;
      }
    } catch (e) {
      print("Error getting Bookings: ${e}");
    } finally {
      update();
    }
  }

  /**************************** remove from list Vehicle */
  remove_coupon(String id) {
    _coupon.removeWhere((e) => e.couponId == id);
    update();
  }

  /********************* delete coupon code */
  deletecouponcode(String id) {
    try {
      manageData.api.coupondoc(id).delete().then(
        (value) {
          remove_coupon(id);
        },
      ).whenComplete(
        () {
          Get.snackbar("Delete", "Coupon Delete Successfuly");
        },
      );
    } catch (e) {
      print('Error Delete Coupon data: $e');
    }
  }
}
