import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/Models/BookingCarModel.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/main.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  final _function = FirebaseResponseHandler();
  List<BookingModel> _bookingcar = [];
  List<BookingModel> get getbookingcar => _bookingcar;
  /****************************************** getcars booking */
  Future<void> getCarsBooking() async {
    try {
      print("-------------------step1");
      final response = await _function.getDataFromFirebase(
          manageData.api.getbookingcollection) as List<FirebaseResponseModel>;
      if (response.isNotEmpty) {
        print("-------------------step2");
        final data = response.map((e) => BookingModel.fromjson(e)).toList();
        // print("=========++++++++++++++======");
        _bookingcar = data;
      }
    } catch (e) {
      print("Error getting Bookings: ${e}");
    } finally {
      update();
    }
  }

  /*************************** update */
  Future<void> updateBooking(
      String uid, Map<String, dynamic> updatedData) async {
    try {
      FirebaseResponseModel? response = await _function.postData(
          manageData.api.bookingdoc(uid), updatedData, RequestType.UPDATE);
      if (response != null) {
        print('Data successfully updated with ID: ${response.docid}');
      }
    } catch (e) {
      print('Error updating Booking data: $e');
    }
  }
}
