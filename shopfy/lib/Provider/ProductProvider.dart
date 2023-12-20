import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopfy/Model/adsmodel.dart';
import 'package:shopfy/Model/productmodel.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = <Product>[];
  List<Ads> adsdata = <Ads>[];

  ProductProvider() {}
  String getAdsImage(int index) {
    return adsdata[index].picture.toString();
  }

  void addProduct(Product newProduct) {
    products.add(newProduct);
    notifyListeners();
  }

  void removeProduct(int productNum) {
    products.removeAt(productNum);
    notifyListeners();
  }

  int get productsNum => products.length;

  Product getProduct(int index) {
    return products[index];
  }

  String? getProductName(int index) {
    return products[index].name;
  }
}
