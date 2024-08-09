class Carmodel {
  String? companyname,
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

  Map<String, dynamic> tomap() {
    return {
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

  Map<String, dynamic> tomap() {
    return {
      "packagetype": packagetype,
      "ammount": ammount,
    };
  }
}
