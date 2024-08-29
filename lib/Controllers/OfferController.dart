import 'package:car_booking_owner/Data/Network/networkapi_service.dart';
import 'package:car_booking_owner/Models/OfferModel.dart';
import 'package:car_booking_owner/Response/DataResponse.dart';
import 'package:car_booking_owner/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OfferController extends GetxController {
  final _service = NetworkapiService();
  DataResponse<List<OfferModel>> _offerdatalist = DataResponse.loading();
  DataResponse<List<OfferModel>> get getofferdata => _offerdatalist;
  Future addoffer(OfferModel model) async {
    try {
      final response =
          await _service.post(manageData.api.getoffercollection, model.tojson())
              as DocumentReference<Map<String, dynamic>>;
      final id = response.id;
      if (id.isNotEmpty) {
        await _service.upDate(manageData.api.offerdoc(id), {"id": id});
      }
    } catch (e) {
      print("---------------------addcar data$e==========================");
    } finally {
      update();
    }
  }
}
