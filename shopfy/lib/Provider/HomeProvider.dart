import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shopfy/Model/adsmodel.dart';

class HomeProvider extends ChangeNotifier {
  List<Ads>? adList;

  void initHomeProvider() async {
    await getAds();
  }

  Future<void> getAds({int? limit}) async {
    try {
      QuerySnapshot<Map<String, dynamic>>? result;
      if (limit != null) {
        result = await FirebaseFirestore.instance
            .collection('ads')
            .limit(limit)
            .get();
      } else {
        result = await FirebaseFirestore.instance.collection('ads').get();
      }

      if (result.docs.isNotEmpty) {
        adList = List<Ads>.from(
          result.docs.map((e) => Ads.fromJson(e.data(), e.id)),
        ).toList();

        notifyListeners();
      } else {
        adList = [];
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching ads: $e');
    }
  }

  Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) async {
    if (!context.mounted) return;
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: title,
      text: content,
    );
  }
}
