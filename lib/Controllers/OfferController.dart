import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/Models/OfferModel.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Response/DataResponse.dart';
import 'package:car_booking_owner/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OfferController extends GetxController {
  // final _service = NetworkapiService();
  final _function = FirebaseResponseHandler();
  DataResponse<List<OfferDetails>> _offerdatalist = DataResponse.loading();
  List<OfferDetails> _addoffers = [];
  List<OfferDetails> get getofferdata => _addoffers;
  Future addOffer(Map<String, dynamic> model) async {
    print("step:-1-=-=-=-=-=-=-=-=-=-=-=-=");
    String? OfferId;
    try {
      DocumentReference docRef = await manageData.api.offerdoc(OfferId);
      final docId = docRef.id;
      model["OfferId"] = docId;
      await _function.postData(docRef, model, RequestType.SET);
      print("step:-2-=-=-=-=-=-=-=-=-=-=-=-=");
      final offers =
          OfferDetails.fromofferdetails(FirebaseResponseModel(model, docId));
      _addoffers.add(offers);
      // print("=========================jkjlvgjidfjigf=======================");
      print(offers);
    } catch (e) {
      // print("=====================================================rrrrrr");
      print('Error adding Offers: $e');
    } finally {
      update();
    }
    return OfferId;
  }

  /********* get all offer function */
  Future<void> getoffers() async {
    try {
      final response = await _function
          .getDataFromFirebase(manageData.api.getoffercollection);
      if (response is List) {
        _addoffers =
            response.map((e) => OfferDetails.fromofferdetails(e)).toList();
      }
    } catch (e) {
      print("Error getting offers: ${e}");
    } finally {
      update();
    }
  }

  /********* update all offer function */
  Future<void> updateOffers(String uid, Map<String, dynamic> update) async {
    try {
      FirebaseResponseModel? response = await _function.postData(
          manageData.api.offerdoc(uid), update, RequestType.UPDATE);
      if (response != null) {
        print('Data successfully updated with ID: ${response.docid}');
      }
    } catch (e) {
      print('Error updating Offers data: $e');
    }
  }

  /**************************** remove from list Vehicle */
  remove_offer(String id) {
    _addoffers.removeWhere((e) => e.OfferId == id);
    update();
  }

  /****************** delete offers */
  offerdelete(String id) {
    try {
      manageData.api.offerdoc(id).delete().then((value) => remove_offer(id));
    } catch (e) {
      print('Error Delete offers data: $e');
    }
  }
}
