import 'package:cloud_firestore/cloud_firestore.dart';
/************************************new car model ******************* */
class Car_model {
  String? car_id;
  String? title;
  double? price;
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

  List<String>? carcolor;
  List<String>? videos;
  List<String>? image;
  List<CreatePackageModel>? createpackagedata;
  Car_model({
    this.addedAt,
    this.car_id,
    this.createdAt,
    this.dicountCode,
    this.discount,
    this.image,
    this.isAvailable,
    this.price,
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
  });
  Car_model.fromcars(FirebaseResponseModel map) : car_id = map.docid;

  Map<String, dynamic> toOrderjson() {
    return {
      "title": title ?? "",
      "price": price ?? 0.0,
      "isAvailable": isAvailable ?? true,
      "quantity": quantity ?? 1,
      "discount": discount ?? 0.0,
      "discountCode": dicountCode ?? "",
    };
  }

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
        carcolor = json.data["carcolor"] != null
            ? (json.data["carcolor"] as List).map((e) => e.toString()).toList()
            : [],
        videos = json.data["videos"] != null
            ? (json.data["videos"] as List).map((e) => e.toString()).toList()
            : [],
        createpackagedata = json.data["createpackagedata"] != null
            ? (json.data["createpackagedata"] as List)
                .map(
                  (e) => CreatePackageModel.fromjson(e),
                )
                .toList()
            : null;

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
    };
  }

  Car_model.fromCarOrder(FirebaseResponseModel json)
      : car_id = json.docid,
        title = json.data["title"] ?? "",
        price = json.data["price"]?.toDouble(),
        isAvailable = json.data["isAvailable"] ?? true,
        quantity = json.data["quantity"].toInt(),
        discount = json.data["discount"].toDouble(),
        dicountCode = json.data["dicountCode"] ?? "";

  Car_model copyWith({
    String? car_id,
    String? title,
    double? price,
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
    List<String>? carcolor,
    List<String>? videos,
    List<String>? image,
    List<CreatePackageModel>? createpackagedata,
  }) {
    return Car_model(
      car_id: car_id ?? this.car_id,
      title: title ?? this.title,
      price: price ?? this.price,
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
    );
  }
}
class CreatePackageModel {
  String? packagetype, ammount;
  CreatePackageModel({
    this.packagetype,
    this.ammount,
  });
  CreatePackageModel copywith({
    String? packagetype,
    String? ammount,
  }) {
    return CreatePackageModel(
      packagetype: packagetype ?? this.packagetype,
      ammount: ammount ?? this.ammount,
    );
  }

  CreatePackageModel.fromjson(Map<String, dynamic> json)
      : packagetype = json["packagetype"],
        ammount = json["ammount"];

  Map<String, dynamic> tomap() {
    return {
      "packagetype": packagetype,
      "ammount": ammount,
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
