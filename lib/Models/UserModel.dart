class Usermodel {
  String id, email, password, image, username, phonenumber;
  bool owner, customer;

  Usermodel({
    required this.id,
    required this.email,
    required this.password,
    required this.image,
    required this.username,
    required this.phonenumber,
    required this.owner,
    required this.customer,
  });
  Usermodel copywith(String id, String email, String password, String image,
      String username, String phonenumber, bool owner, bool customer) {
    return Usermodel(
        id: id,
        email: email,
        password: password,
        image: image,
        username: username,
        phonenumber: phonenumber,
        owner: owner,
        customer: customer);
  }

  Map<String, dynamic> tomap() {
    return {
      "id": id,
      "email": email,
      "password": password,
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
}
