class Ads {
  String? id;
  String? title;
  String? picture;
  DateTime? createdAt;

  Ads();

  Ads.fromJson(Map<String, dynamic> json, String docId) {
    id = docId;
    title = json['title'];
    picture = json['picture'];
    createdAt = json['createdAt'] != null
        ? DateTime.fromMillisecondsSinceEpoch(
            json['createdAt'].millisecondsSinceEpoch)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> adsdata = {};
    adsdata['id'] = id;
    adsdata['title'] = title;
    adsdata['picture'] = picture;
    adsdata['createdAt'] = createdAt;
    return adsdata;
  }
}
