// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_booking_owner/Models/carmodel.dart';

// class Usermodel {
//   String id, email, address, image, username, phonenumber;
//   bool owner, customer;

//   Usermodel({
//     this.id = "",
//     this.email = "",
//     this.address = "",
//     this.image = "",
//     this.username = "",
//     this.phonenumber = "",
//     this.owner = true,
//     this.customer = false,
//   });
//   Usermodel copywith(
//       {String? id,
//       String? email,
//       String? address,
//       String? image,
//       String? username,
//       String? phonenumber,
//       bool? owner,
//       bool? customer}) {
//     return Usermodel(
//         id: id ?? this.id,
//         email: email ?? this.email,
//         address: address ?? this.address,
//         image: image ?? this.image,
//         username: username ?? this.username,
//         phonenumber: phonenumber ?? this.phonenumber,
//         owner: owner ?? true,
//         customer: customer ?? false);
//   }

//   Map<String, dynamic> tomap() {
//     return {
//       "id": id,
//       "email": email,
//       "image": image,
//       "username": username,
//       "phonenumber": phonenumber,
//       "address": address,
//       "owner": owner,
//       "customer": customer,
//     };
//   }

//   Usermodel.fromjson(Map<String, dynamic> json)
//       : id = json["id"] ?? "",
//         email = json["email"] ?? "",
//         address = json["password"] ?? "",
//         image = json["image"] ?? "",
//         username = json["username"] ?? "",
//         phonenumber = json["phonenumber"] ?? "",
//         owner = json["owner"] ?? "",
//         customer = json["customer"] ?? "";

//   @override
//   String toString() =>
//       'Usermodel(phonenumber: $phonenumber, customer: $customer,email:$email)';
// }

class Usermodel {
  String? id,
      name,
      email,
      phonenumber,
      image,
      titleAddress,
      streetaddress,
      country,
      state,
      city,
      postalcode,
      documenttype,
      documentnumber,
      documentexpirydate,
      documentimage;
  bool? owner, customer;
  Usermodel(
      {this.id = "",
      this.name = "",
      this.email = "",
      this.phonenumber = "",
      this.image = "",
      this.owner = true,
      this.customer = false,
      this.titleAddress = "",
      this.streetaddress = "",
      this.country = "",
      this.state = "",
      this.city = "",
      this.postalcode = "",
      this.documenttype = "",
      this.documentnumber = "",
      this.documentexpirydate = "",
      this.documentimage = ""});

//  Copy With
  Usermodel copyWith(
      {String? id,
      String? name,
      String? email,
      String? phonenumber,
      String? image,
      bool? owner,
      bool? customer,
      String? titleAddress,
      String? streetaddress,
      String? country,
      String? state,
      String? city,
      String? postalcode,
      String? documenttype,
      String? documentnumber,
      String? documentexpirydate,
      String? documentimage}) {
    return Usermodel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phonenumber: phonenumber ?? this.phonenumber,
      image: image ?? this.image,
      owner: owner ?? this.owner,
      customer: customer ?? this.customer,
      titleAddress: titleAddress ?? this.titleAddress,
      streetaddress: streetaddress ?? this.streetaddress,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      postalcode: postalcode ?? this.postalcode,
      documenttype: documenttype ?? this.documenttype,
      documentnumber: documentnumber ?? this.documentnumber,
      documentexpirydate: documentexpirydate ?? this.documentexpirydate,
      documentimage: documentimage ?? this.documentimage,
    );
  }

  // To Map
  Map<String, dynamic> tomap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phonenumber": phonenumber,
      "image": image,
      "owner": owner,
      "customer": customer,
      "titleAdress": titleAddress
    };
  }

  // From Json
  Usermodel.fromjson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        name = json["name"] ?? "",
        email = json["email"] ?? "",
        phonenumber = json["phonenumber"] ?? "",
        image = json["image"] ?? "",
        owner = json["owner"] ?? false,
        customer = json["customer"] ?? false,
        titleAddress = json["titleAddress"] ?? "",
        streetaddress = json["streetaddress"] ?? "",
        country = json["country"] ?? "",
        state = json["state"] ?? "",
        city = json["city"] ?? "",
        postalcode = json["postalcode"] ?? "",
        documenttype = json["documenttype"] ?? "",
        documentnumber = json["documentnumber"] ?? "",
        documentexpirydate = json["documentexpirydate"] ?? "",
        documentimage = json["documentimage"] ?? "";

  // USER MODEL USE TO BOOKING MODEL //
  // CREATE TO MAP
  Map<String, dynamic> toUserBooking() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phonenumber": phonenumber,
      "image": image,
      "owner": owner,
      "customer": customer,
      "titleAddress": titleAddress,
      "streetaddress": streetaddress,
      "country": country,
      "state": state,
      "city": city,
      "postalcode": postalcode,
      "documenttype": documenttype,
      "documentnumber": documentnumber,
      "documentexpirydate": documentexpirydate,
      "documentimage": documentimage,
    };
  }

  // From Json
  Usermodel.fromUserBooking(FirebaseResponseModel json)
      : id = json.data["id"] ?? "",
        name = json.data["name"] ?? "",
        email = json.data["email"] ?? "",
        phonenumber = json.data["phonenumber"] ?? "",
        image = json.data["image"] ?? "",
        owner = json.data["owner"] ?? false,
        customer = json.data["customer"] ?? false,
        titleAddress = json.data["titleAddress"] ?? "",
        streetaddress = json.data["streetaddress"] ?? "",
        country = json.data["country"] ?? "",
        state = json.data["state"] ?? "",
        city = json.data["city"] ?? "",
        postalcode = json.data["postalcode"] ?? "",
        documenttype = json.data["documenttype"] ?? "",
        documentnumber = json.data["documentnumber"] ?? "",
        documentexpirydate = json.data["documentexpirydate"] ?? "",
        documentimage = json.data["documentimage"] ?? "";
}
