class CartModel {
  int? id;
  String? productId;
  String? image;
  String? title;
  String? subTitle;
  String? color;
  String? size;
  double? price;
  int? quantity;

  CartModel({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.productId,
    this.subTitle,
    this.image,
    this.color,
    this.size,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'productId': productId,
      'image': image,
      'subTitle': subTitle,
      'title': title,
      'price': price,
      'quantity': quantity,
      'color': color,
      'size': size,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      productId: map['productId'],
      title: map['title'],
      subTitle: map['subTitle'],
      image: map['image'],
      color: map['color'],
      size: map['size'],
      price: map['price']?.toDouble(),
      quantity: map['quantity']?.toInt(),
    );
  }

  @override
  String toString() {
    return 'CartModel(id: $id, productId: $productId, title: $title, subTitle: $subTitle, image: $image, color: $color, size: $size, price: $price, quantity: $quantity)';
  }
}
