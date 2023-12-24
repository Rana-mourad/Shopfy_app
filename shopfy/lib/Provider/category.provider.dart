import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shopfy/Model/category_model.dart';

class CategoryProvider {
  Future<List<CategoryData>?> getCategory(BuildContext context,
      {int? limit}) async {
    try {
      QuerySnapshot<Map<String, dynamic>>? result;
      if (limit != null) {
        result = await FirebaseFirestore.instance
            .collection('category')
            .limit(limit)
            .get();
      } else {
        result = await FirebaseFirestore.instance.collection('category').get();
      }

      if (result.docs.isNotEmpty) {
        var categoriesList = List<CategoryData>.from(
                result.docs.map((e) => CategoryData.fromJson(e.data(), e.id)))
            .toList();

        return categoriesList;
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
