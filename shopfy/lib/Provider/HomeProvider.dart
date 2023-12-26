import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shopfy/Model/adsmodel.dart';

class HomeProvider {
  Future<List<Ads>?> getAds(BuildContext context, {int? limit}) async {
    try {
      QuerySnapshot<Map<String, dynamic>>? result;
      if (limit != null) {
        result = await FirebaseFirestore.instance
            .collection('Ads')
            .limit(limit)
            .get();
      } else {
        result = await FirebaseFirestore.instance.collection('Ads').get();
      }

      if (result.docs.isNotEmpty) {
        var AdsList =
            List<Ads>.from(result.docs.map((e) => Ads.fromJson(e.data(), e.id)))
                .toList();

        return AdsList;
      } else {
        return [];
      }
    } catch (e) {
      if (!context.mounted) return null;
      await QuickAlert.show(
          context: context, type: QuickAlertType.error, title: e.toString());
      return null;
    }
  }
}
