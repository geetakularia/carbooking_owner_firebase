import 'package:car_booking_owner/Utils/Enums/enums.dart';

class DataResponse<T> {
  T? data;
  String? msg;
  Status? status;
  DataResponse(this.data, this.msg, this.status);
  DataResponse.loading() : status = Status.Loading;
  DataResponse.error(this.msg) : status = Status.Error;
  DataResponse.completed(this.data) : status = Status.Completed;
  String tostring() {
    return "stauts:$status\n  data$data\n msg:$msg";
  }
}
