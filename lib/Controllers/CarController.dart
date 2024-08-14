import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Res/Apis/apis.dart';

class CarController {
  List<Carmodel> _cardatalist = [];
  List<Carmodel> get getcardata => _cardatalist;
  Future addcarData(Map<String, dynamic> addData) async {
    Apis().getcarcollection.add(addData).then((value) {
      Carmodel.
    },);
  }
}
