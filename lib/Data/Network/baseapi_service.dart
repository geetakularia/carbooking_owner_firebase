import 'package:car_booking_owner/Utils/Enums/enums.dart';

abstract class BaseapiService {
  Future<dynamic> authenticate(AuthState state, {Map<String, dynamic>? json});
  Future<dynamic> post(path, Map<String, dynamic> data);
  Future<dynamic> getdata(path);
}
