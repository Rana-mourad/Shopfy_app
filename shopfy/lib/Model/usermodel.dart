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
    this.uId = data["uId"] ?? "uId";
    this.username = data["username"] ?? "username";
    this.email = data["email"] ?? "email";
    this.image = data["image"] ?? "image";
    this.dateOfRegister = data["dateOfRegister"];
    this.phoneNumber = data["phoneNumber"];
    this.country = data["country"];
    this.address = data["address"];
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
