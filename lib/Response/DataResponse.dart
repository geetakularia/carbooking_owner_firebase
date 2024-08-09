import 'package:car_booking_owner/Utils/Enums/enums.dart';

class DataResonse<T> {
  T? data;
  String? msg;
  Status? status;
  DataResonse(this.data, this.msg, this.status);
  DataResonse.loading() : status = Status.Loading;
  DataResonse.error(this.msg) : status = Status.Error;
  DataResonse.completed(this.data) : status = Status.Completed;
  String tostring() {
    return "stauts:$status\n  data$data\n msg:$msg";
  }
}
