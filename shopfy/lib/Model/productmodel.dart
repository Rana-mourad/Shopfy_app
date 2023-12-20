class Product {
  String? id;
  String? categoryId;
  String? description;
  String? name;
  double? price;
  String? image;
  String? title;
  int? quantity;

  Product();

  Product.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    categoryId = data['categoryId'];
    description = data['description'];
    name = data['name'];
    price = data['price'];
    quantity = data['quantity'];
    image = data['image'];
    title = data['title'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "description": description,
      "name": name,
      "price": price,
      "quantity": quantity,
      "image": image,
      "title": title,
    };
  }
}
