class ShippingAddressModel {
  String? name;
  String? mainStreet;
  String? subStreet;
  String? city;
  String? country;
  ShippingAddressModel({
    this.name,
    this.mainStreet,
    this.subStreet,
    this.city,
    this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mainStreet': mainStreet,
      'subStreet': subStreet,
      'city': city,
      'country': country,
    };
  }

  factory ShippingAddressModel.fromMap(Map<String, dynamic> map) {
    return ShippingAddressModel(
      name: map['name'],
      mainStreet: map['mainStreet'],
      subStreet: map['subStreet'],
      city: map['city'],
      country: map['country'],
    );
  }

  @override
  String toString() {
    return 'ShippingAddressModel(name: $name, mainStreet: $mainStreet, subStreet: $subStreet, city: $city, country: $country)';
  }
}
