import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Res/Apis/apis.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  List<Carmodel> _cardatalist = [];
  List<Carmodel> get getcardata => _cardatalist;
  Future addcarData(Map<String, dynamic> addData) async {
    try {
      Apis().getcarcollection.add(addData).then(
        (value) {
          final model = Carmodel.fromjson(addData).copywith(id: value.id);
          _cardatalist.add(model);
        },
      );
    } catch (e) {
      print("---------------------addcar data $e==========================");
    } finally {
      update();
    }
  }
}
