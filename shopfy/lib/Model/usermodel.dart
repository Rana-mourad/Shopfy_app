class UserModel {
  String? uId;
  String? username;
  String? email;
  String? dateOfRegister;
  String? image;
  int? phoneNumber;
  String? country;
  String? address;
  UserModel({
    this.uId,
    this.username,
    this.email,
    this.dateOfRegister,
    this.image,
    this.phoneNumber,
    this.address,
    this.country,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    uId = data["uId"] ?? "uId";
    username = data["username"] ?? "username";
    email = data["email"] ?? "email";
    image = data["image"] ?? "image";
    dateOfRegister = data["dateOfRegister"];
    phoneNumber = data["phoneNumber"];
    country = data["country"];
    address = data["address"];
  }

  Map<String, dynamic> get toMap {
    return {
      "uId": uId,
      "username": username,
      "email": email,
      "dateOfRegister": dateOfRegister,
      "image": image,
      "phoneNumber": phoneNumber,
      "country": country,
      "address": address,
    };
  }
}
