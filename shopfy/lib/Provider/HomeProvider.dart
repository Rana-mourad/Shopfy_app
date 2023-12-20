import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:shopfy/Model/adsmodel.dart';
import 'package:shopfy/theme/collectionutils.dart';

class HomeProvider extends ChangeNotifier {
  List<Ads>? adList;
  List<Category>? categoryList;

  void initHomeProvider() async {
    await getAds();
    await getCategory();
  }

  Future<void> getAds() async {
    QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection(CollectionsUtils.ads.name)
        .get();
    adList =
        List<Ads>.from(result.docs.map((e) => Ads.fromJson(e.data(), e.id)));
    notifyListeners();
  }

  Future<void> getCategory() async {
    QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection(CollectionsUtils.category.name)
        .get();
    categoryList = List<Category>.from(
        result.docs.map((e) => Category.fromJson(e.data(), e.id)));
    notifyListeners();
  }
}
