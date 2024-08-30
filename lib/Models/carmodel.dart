import 'package:cloud_firestore/cloud_firestore.dart';

class Carmodel {
  String? companyname,
      id,
      carmodel,
      platenumber,
      transmission,
      seatingcapacity,
      fuel,
      category,
      manufactureyear,
      description;
  List<String>? carcolor;
  List<String>? images;
  List<String>? videos;
  List<CreatePackageModel>? createpackagedata;
  Carmodel(
      {this.companyname,
      this.id,
      this.carmodel,
      this.platenumber,
      this.transmission,
      this.seatingcapacity,
      this.fuel,
      this.category,
      this.manufactureyear,
      this.description,
      this.carcolor,
      this.images,
      this.videos,
      this.createpackagedata});
  Carmodel copywith(
      {String? companyname,
      String? id,
      String? carmodel,
      String? platenumber,
      String? transmission,
      String? seatingcapacity,
      String? fuel,
      String? category,
      String? manufactureyear,
      String? description,
      List<String>? carcolor,
      List<String>? images,
      List<String>? videos,
      List<CreatePackageModel>? createpackagedata}) {
    return Carmodel(
      companyname: companyname ?? this.companyname,
      id: id ?? this.id,
      carmodel: carmodel ?? this.carmodel,
      platenumber: platenumber ?? this.platenumber,
      transmission: transmission ?? this.transmission,
      seatingcapacity: seatingcapacity ?? this.seatingcapacity,
      fuel: fuel ?? this.fuel,
      category: category ?? this.category,
      manufactureyear: manufactureyear ?? this.manufactureyear,
      description: description ?? this.description,
      carcolor: carcolor ?? this.carcolor,
      images: images ?? this.images,
      videos: videos ?? this.videos,
      createpackagedata: createpackagedata ?? this.createpackagedata,
    );
  }

  Carmodel.fromjson(Map<String, dynamic> json)
      : companyname = json["companyname"],
        id = json["id"],
        carmodel = json["carmodel"],
        platenumber = json["platenumber"],
        transmission = json["transmission"],
        seatingcapacity = json["seatingcapacity"],
        fuel = json["fuel"],
        category = json["category"],
        manufactureyear = json["manufactureyear"],
        description = json["description"],
        carcolor = json["carcolor"] != null
            ? (json["carcolor"] as List).map((e) => e.toString()).toList()
            : [],
        images = json['images'] != null
            ? (json["image"] as List).map((e) => e.toString()).toList()
            : [],
        videos = json["videos"] != null
            ? (json["videos"] as List).map((e) => e.toString()).toList()
            : [],
        createpackagedata = json["createpackagedata"] != null
            ? (json["createpackagedata"] as List)
                .map(
                  (e) => CreatePackageModel.fromjson(e),
                )
                .toList()
            : null;

  Map<String, dynamic> tomap() {
    return {
      "companyname": companyname,
      "id": id,
      "carmodel": carmodel,
      "platenumber": platenumber,
      "transmission": transmission,
      "seatingcapacity": seatingcapacity,
      "fuel": fuel,
      "category": category,
      "manufactureyear": manufactureyear,
      "description": description,
      "carcolor": carcolor,
      "images": images,
      "videos": videos,
      "createpackagedata":
          createpackagedata?.map((e) => e.tomap()).toList() ?? [],
    };
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

/************************************new car model ******************* */
class Car_model {
  String? car_id;
  String? title;
  double? price;
  List<String>? image;
  DateTime? createdAt;
  DateTime? updateAt;
  bool? isAvailable;
  int? quantity;
  double? discount;
  String? dicountCode;
  DateTime? addedAt;

  Car_model(
      {this.addedAt,
      this.car_id,
      this.createdAt,
      this.dicountCode,
      this.discount,
      this.image,
      this.isAvailable,
      this.price,
      this.quantity,
      this.title,
      this.updateAt});
  Car_model.fromcars(FirebaseResponseModel map)
      : car_id = map.docid,
        title = map.data["title"] ?? "",
        price = map.data["price"]?.double();
// tor
  // Map<String, dynamic> toOrderjson() {
  //   return {
  //     "title": title ?? "",
  //     "price": price ?? 0.0,
  //     "isAvailable": isAvailable ?? true,
  //     "quantity": quantity ?? 1,
  //     "discount": discount ?? 0.0,
  //     "discountCode": dicountCode ?? "",
  //   };
  // }

  Map<String, dynamic> toProduct() {
    return {
      "title": title ?? "",
      "price": price ?? 0.0,
      "createdAt": createdAt ?? DateTime.now().millisecondsSinceEpoch,
      "updatedAt": updateAt ?? DateTime.now().millisecondsSinceEpoch,
      "images": image ?? [],
      'isAvailable': isAvailable ?? true
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
}

class FirebaseResponseModel {
  Map<String, dynamic> data;
  String docid;
  FirebaseResponseModel(this.data, this.docid);
  FirebaseResponseModel.fromResonse(DocumentSnapshot snapshot)
      : data = snapshot.data() as Map<String, dynamic>,
        docid = snapshot.id;
}
