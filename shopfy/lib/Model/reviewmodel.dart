class ReviewModel {
  String? name;
  String? description;
  int? rating;
  String? image;

  ReviewModel({
    this.name,
    this.description,
    this.rating,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'rating': rating,
      'image': image,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      name: map['name'],
      description: map['description'],
      rating: map['rating']?.toInt(),
      image: map['image'],
    );
  }
}
