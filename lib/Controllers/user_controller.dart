import 'package:car_booking_owner/Data/Network/networkapi_service.dart';
import 'package:car_booking_owner/Models/UserModel.dart';
import 'package:car_booking_owner/Response/DataResponse.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final services = NetworkapiService();
  // LOADING
  bool _loading = false;

  // LOADING GET
  bool get loading => _loading;

  // LOADING SET
  setloading(bool value) {
    _loading = value;
    update();
  }

  DataResonse<Usermodel> _userdata = DataResonse.loading();
  DataResonse<Usermodel> get userdata => _userdata;

  Future<void> signup() async {
  
  }
}
