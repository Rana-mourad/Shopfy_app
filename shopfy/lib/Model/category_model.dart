class Category {
  String? id;
  String? title;
  String? description;

  Category();

  Category.fromJson(Map<String, dynamic> json, String docId) {
    id = docId;
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> categoryData = {};
    categoryData['id'] = id;
    categoryData['title'] = title;
    categoryData['description'] = description;
    return categoryData;
  }
}
