import 'package:car_booking_owner/Models/UserModel.dart';
import 'package:car_booking_owner/Models/carmodel.dart';

enum BookingState { REQUEST, PENDING, REJECTED, COMPLETE, ACCEPT }

class BookingModel {
  String? id;
  String? bookingID;
  String? time;
  String? date;
  int? amount;
  String? paymentType;
  AddressModel? address;
  AddressModel? destination;
  BookingState? bookingState;
  Usermodel? user;
  List<Car_model>? cars;

  BookingModel({
    this.id,
    this.bookingID,
    this.time,
    this.date,
    this.amount,
    this.paymentType,
    this.address,
    this.destination,
    this.bookingState,
    this.user,
    this.cars,
  });

  Map<String, dynamic> tomap() {
    return {"bookingState": (bookingState ?? BookingState.REQUEST).name};
  }

  // BOOKING FROM JSON
  BookingModel.fromjson(FirebaseResponseModel json)
      : id = json.docid,
        bookingID = json.data["bookingID"] ?? "",
        time = json.data["time"] ?? "",
        date = json.data["date"] ?? "",
        amount = json.data["amount"] ?? 0,
        bookingState = (json.data["bookingState"] != null)
            ? BookingState.values.firstWhere(
                (e) => e.name == json.data["bookingState"],
                orElse: () => BookingState.REQUEST,
              )
            : BookingState.REQUEST,
        address = AddressModel.fromjson(
            FirebaseResponseModel(json.data["address"] ?? {}, "")),
        destination = AddressModel.fromjson(
            FirebaseResponseModel(json.data["destination"] ?? {}, "")),
        paymentType = json.data["paymentType"] ?? "",
        user = json.data["user"] != null
            ? Usermodel.fromjson(json.data["user"])
            : null,
        cars = json.data["cars"] != null
            ? (json.data["cars"] as List)
                .map((e) => Car_model.fromAddvehicle(
                    FirebaseResponseModel(e ?? {}, "")))
                .toList()
            : [];

  // COPY WITH
  BookingModel copyWith({
    String? id,
    String? bookingID,
    String? time,
    String? date,
    int? amount,
    AddressModel? address,
    AddressModel? description,
    BookingState? bookingState,
    String? paymentType,
    Usermodel? user,
    List<Car_model>? cars,
  }) {
    return BookingModel(
      id: id ?? this.id,
      bookingID: bookingID ?? this.bookingID,
      time: time ?? this.time,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      address: address ?? this.address,
      destination: destination ?? this.destination,
      bookingState: bookingState ?? this.bookingState,
      paymentType: paymentType ?? this.paymentType,
      user: user ?? this.user,
      cars: cars ?? this.cars,
    );
  }
}

class AddressModel {
  String? id;
  double? latitude;
  double? longitude;
  String? addressTitle;
  String? houseNoBuildingName;
  String? contactName;
  String? contactNumber;
  bool? defaultAddress;
  AddressModel({
    this.id,
    this.latitude,
    this.longitude,
    this.addressTitle,
    this.houseNoBuildingName,
    this.contactName,
    this.contactNumber,
    this.defaultAddress,
  });

  AddressModel copyWith({
    String? id,
    double? latitude,
    double? longitude,
    String? addressTitle,
    String? houseNoBuildingName,
    String? contactName,
    String? contactNumber,
    bool? defaultAddress,
  }) {
    return AddressModel(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      addressTitle: addressTitle ?? this.addressTitle,
      houseNoBuildingName: houseNoBuildingName ?? this.houseNoBuildingName,
      contactName: contactName ?? this.contactName,
      contactNumber: contactNumber ?? this.contactNumber,
      defaultAddress: defaultAddress ?? this.defaultAddress,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'latitude': latitude,
  //     'longitude': longitude,
  //     'addressTitle': addressTitle,
  //     'houseNoBuildingName': houseNoBuildingName,
  //     'contactName': contactName,
  //     'contactNumber': contactNumber,
  //     'defaultAddress': defaultAddress ?? false,
  //   };
  // }

  AddressModel.fromjson(FirebaseResponseModel json)
      : id = json.data["id"] ?? "",
        latitude = json.data['latitude'].toDouble() ?? 0.0,
        longitude = json.data['longitude'].toDouble() ?? 0.0,
        addressTitle = json.data['addressTitle'] ?? "",
        houseNoBuildingName = json.data['houseNoBuildingName'] ?? "",
        contactName = json.data['contactName'] ?? "",
        contactNumber = json.data['contactNumber'] ?? "",
        defaultAddress = json.data['defaultAddress'] ?? false;
}
