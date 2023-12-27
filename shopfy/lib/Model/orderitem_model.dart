import 'package:shopfy/Model/ShippingAdressModel.dart';
import 'package:shopfy/Model/cartmodel.dart';

class OrderModel {
  String? id;
  double? totalPrice;
  String? dateTime;
  List<CartItem>? carts = [];
  ShippingAddressModel? shippingAddress;
  OrderModel({
    this.totalPrice,
    this.dateTime,
    this.carts,
    this.id,
    this.shippingAddress,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'totalPrice': totalPrice,
      'dateTime': dateTime,
      'shippingAddress': shippingAddress?.toMap(),
      'carts': carts?.map<Map<String, dynamic>>((e) => e.toJson()),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      shippingAddress: ShippingAddressModel.fromMap(map['shippingAddress']),
      totalPrice: map['totalPrice']?.toDouble(),
      dateTime: map['dateTime'],
      carts: map['carts'] != null
          ? List<CartItem>.from(map['carts']?.map((e) => CartItem.fromJson(e)))
          : null,
    );
  }
}
