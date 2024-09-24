import 'package:cloud_firestore/cloud_firestore.dart';

/************************************new car model ******************* */

class Car_model {
  String? car_id;
  String? title;
  DateTime? createdAt;
  DateTime? updateAt;
  bool? isAvailable;
  int? quantity;
  double? discount;
  String? dicountCode;
  DateTime? addedAt;
  String? companyname;
  String? carmodel;
  String? platenumber;
  String? transmission;
  String? seatingcapacity;
  String? fuel;
  String? category;
  String? manufactureyear;
  String? description;
  String? carcolor;
  List<String>? videos;
  List<String>? image;
  String? carstatus;

  List<CreatePackageModel>? createpackagedata;
  Car_model({
    this.addedAt,
    this.car_id,
    this.createdAt,
    this.dicountCode,
    this.discount,
    this.image,
    this.isAvailable,
    this.quantity,
    this.title,
    this.updateAt,
    this.companyname,
    this.carmodel,
    this.platenumber,
    this.transmission,
    this.seatingcapacity,
    this.fuel,
    this.category,
    this.manufactureyear,
    this.description,
    this.carcolor,
    this.videos,
    this.createpackagedata,
    this.carstatus,
  });
  // Car_model.fromcars(FirebaseResponseModel map) : car_id = map.docid;

  Car_model.fromAddvehicle(FirebaseResponseModel json)
      : car_id = json.docid,
        companyname = json.data["companyname"] ?? "",
        image = json.data["image"] != null
            ? (json.data["image"] as List)
                .map(
                  (e) => e.toString(),
                )
                .toList()
            : [],
        carmodel = json.data["carmodel"] ?? "",
        platenumber = json.data["platenumber"] ?? "",
        transmission = json.data["transmission"] ?? "",
        seatingcapacity = json.data["seatingcapacity"] ?? "",
        fuel = json.data["fuel"] ?? "",
        category = json.data["category"] ?? "",
        manufactureyear = json.data["manufactureyear"] ?? "",
        description = json.data["description"] ?? "",
        carcolor = json.data["carcolor"] ?? "",
        videos = json.data["videos"] != null
            ? (json.data["videos"] as List).map((e) => e.toString()).toList()
            : [],
        createpackagedata = json.data["createpackagedata"] != null
            ? (json.data["createpackagedata"] as List)
                .map(
                  (e) => CreatePackageModel.fromjson(e),
                )
                .toList()
            : null,
        carstatus = json.data["carstatus"] ?? "";

  Map<String, dynamic> toAddvehicle() {
    return {
      "car_id": car_id,
      "companyname": companyname,
      "carmodel": carmodel,
      "platenumber": platenumber,
      "transmission": transmission,
      "seatingcapacity": seatingcapacity,
      "fuel": fuel,
      "category": category,
      "manufactureyear": manufactureyear,
      "description": description,
      "carcolor": carcolor,
      "videos": videos,
      "createpackagedata":
          createpackagedata?.map((e) => e.tomap()).toList() ?? [],
      "image": image,
      "carstatus": carstatus,
    };
  }

  Car_model copyWith({
    String? car_id,
    String? title,
    DateTime? createdAt,
    DateTime? updateAt,
    bool? isAvailable,
    int? quantity,
    double? discount,
    String? dicountCode,
    DateTime? addedAt,
    String? companyname,
    String? carmodel,
    String? platenumber,
    String? transmission,
    String? seatingcapacity,
    String? fuel,
    String? category,
    String? manufactureyear,
    String? description,
    double? ammount,
    String? packagetype,
    String? carcolor,
    String? carstatus,
    List<String>? videos,
    List<String>? image,
    List<CreatePackageModel>? createpackagedata,
  }) {
    return Car_model(
      car_id: car_id ?? this.car_id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
      isAvailable: isAvailable ?? this.isAvailable,
      quantity: quantity ?? this.quantity,
      discount: discount ?? this.discount,
      dicountCode: dicountCode ?? this.dicountCode,
      addedAt: addedAt ?? this.addedAt,
      companyname: companyname ?? this.companyname,
      carmodel: carmodel ?? this.carmodel,
      platenumber: platenumber ?? this.platenumber,
      transmission: transmission ?? this.transmission,
      seatingcapacity: seatingcapacity ?? this.seatingcapacity,
      fuel: fuel ?? this.fuel,
      category: category ?? this.category,
      manufactureyear: manufactureyear ?? this.manufactureyear,
      description: description ?? this.description,
      carcolor: carcolor ?? this.carcolor,
      videos: videos ?? this.videos,
      image: image ?? this.image,
      createpackagedata: createpackagedata ?? this.createpackagedata,
      carstatus: carstatus ?? this.carstatus,
    );
  }
}

enum PackageType { HOUR, DAY, WEEK }

class CreatePackageModel {
  String? packagetype;
  int? ammount;
  PackageType? type;
  CreatePackageModel({this.packagetype, this.ammount, this.type});
  CreatePackageModel copywith(
      {String? packagetype, int? ammount, PackageType? type}) {
    return CreatePackageModel(
      packagetype: packagetype ?? this.packagetype,
      ammount: ammount ?? this.ammount,
    );
  }

  CreatePackageModel.fromjson(Map<String, dynamic> json)
      : packagetype = json["packagetype"] ?? "",
        ammount = json["ammount"] ?? "",
        type = PackageType.values.firstWhere((e) => e.name == json["type"]);

  Map<String, dynamic> tomap() {
    return {
      "packagetype": packagetype,
      "ammount": ammount,
      "type": type!.name,
    };
  }
}

class FirebaseResponseModel {
  Map<String, dynamic> data;
  String docid;
  FirebaseResponseModel(this.data, this.docid);
  FirebaseResponseModel.fromResonse(DocumentSnapshot snapshot)
      : data = snapshot.data() as Map<String, dynamic>,
        docid = snapshot.id;
}
