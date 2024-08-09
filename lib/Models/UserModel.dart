
// ignore_for_file: public_member_api_docs, sort_constructors_first
class Usermodel {
  String id, email, password, image, username, phonenumber;
  bool owner, customer;

  Usermodel({
    this.id = "",
    this.email = "",
    this.password = "",
    this.image = "",
    this.username = "",
    this.phonenumber = "",
    this.owner = true,
    this.customer = false,
  });
  Usermodel copywith(
      {String? id,
      String? email,
      String? password,
      String? image,
      String? username,
      String? phonenumber,
      bool? owner,
      bool? customer}) {
    return Usermodel(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        image: image ?? this.image,
        username: username ?? this.username,
        phonenumber: phonenumber ?? this.phonenumber,
        owner: owner ?? true,
        customer: customer ?? false);
  }

  Map<String, dynamic> tomap() {
    return {
      "id": id,
      "email": email,
      "image": image,
      "username": username,
      "phonenumber": phonenumber,
      "owner": owner,
      "customer": customer,
    };
  }

  Usermodel.fromjson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        email = json["email"] ?? "",
        password = json["password"] ?? "",
        image = json["image"] ?? "",
        username = json["username"] ?? "",
        phonenumber = json["phonenumber"] ?? "",
        owner = json["owner"] ?? "",
        customer = json["customer"] ?? "";

  @override
  String toString() =>
      'Usermodel(phonenumber: $phonenumber, customer: $customer,email:$email)';
}
