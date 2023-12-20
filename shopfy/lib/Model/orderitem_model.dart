import 'package:shopfy/Model/ShippingAdressModel.dart';
import 'package:shopfy/Model/cartmodel.dart';

class OrderModel {
  String? id;
  double? totalPrice;
  String? dateTime;
  List<CartModel>? carts = [];
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
      'carts': carts?.map<Map<String, dynamic>>((x) => x.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      shippingAddress: ShippingAddressModel.fromMap(map['shippingAddress']),
      totalPrice: map['totalPrice']?.toDouble(),
      dateTime: map['dateTime'],
      carts: map['carts'] != null
          ? List<CartModel>.from(map['carts']?.map((x) => CartModel.fromMap(x)))
          : null,
    );
  }
}
