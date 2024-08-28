import 'package:car_booking_owner/Data/Network/networkapi_service.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Response/DataResponse.dart';
import 'package:car_booking_owner/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  final _services = NetworkapiService();
  DataResponse<List<Carmodel>> _cardatalist = DataResponse.loading();
  DataResponse<List<Carmodel>> get getcardata => _cardatalist;
  Future addcarData(Carmodel model) async {
    try {
      final response =
          await _services.post(manageData.api.getcarcollection, model.tomap())
              as DocumentReference<Map<String, dynamic>>;

      final id = response.id;
      if (id.isNotEmpty) {
        await _services.upDate(manageData.api.cardoc(id), {"id": id});
      }
    } catch (e) {
      print("---------------------addcar data$e==========================");
    } finally {
      update();
    }
  }
}
