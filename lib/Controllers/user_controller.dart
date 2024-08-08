import 'package:get/get.dart';

class UserController extends GetxController {
  // LOADING
  bool _loading = false;

  // LOADING GET
  bool get loading => _loading;

  // LOADING SET
  setloading(bool value) {
    _loading = value;
    update();
  }
}
