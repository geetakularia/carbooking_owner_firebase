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
        carcolor = (json["carcolor"] as List).map((e) => e.toString()).toList(),
        images = (json["image"] as List).map((e) => e.toString()).toList(),
        videos = (json["videos"] as List).map((e) => e.toString()).toList(),
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
      "createpackagedata": createpackagedata!.map((e) => e.tomap()).toList(),
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
