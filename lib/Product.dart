import 'dart:convert';

class Product {
  String name;
  String image;
  int id;
  bool isStared;
  String description;
  int distance;
  int cost;
  String shopName;
  String shopCity;
  double shopLat;
  double shopLong;
  Product({
    this.name,
    this.image,
    this.id,
    this.isStared,
    this.description,
    this.distance,
    this.cost,
    this.shopName,
    this.shopCity,
    this.shopLat,
    this.shopLong,
  });

  Product copyWith({
    String name,
    String image,
    int id,
    bool isStared,
    String description,
    int distance,
    int cost,
    String shopName,
    String shopCity,
    double shopLat,
    double shopLong,
  }) {
    return Product(
      name: name ?? this.name,
      image: image ?? this.image,
      id: id ?? this.id,
      isStared: isStared ?? this.isStared,
      description: description ?? this.description,
      distance: distance ?? this.distance,
      cost: cost ?? this.cost,
      shopName: shopName ?? this.shopName,
      shopCity: shopCity ?? this.shopCity,
      shopLat: shopLat ?? this.shopLat,
      shopLong: shopLong ?? this.shopLong,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'id': id,
      'isStared': isStared,
      'description': description,
      'distance': distance,
      'cost': cost,
      'shopName': shopName,
      'shopCity': shopCity,
      'shopLat': shopLat,
      'shopLong': shopLong,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Product(
      name: map['name'],
      image: map['image'],
      id: map['id'],
      isStared: map['isStared'],
      description: map['description'],
      distance: map['distance'],
      cost: map['cost'],
      shopName: map['shopName'],
      shopCity: map['shopCity'],
      shopLat: map['shopLat'],
      shopLong: map['shopLong'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(name: $name, image: $image, id: $id, isStared: $isStared, description: $description, distance: $distance, cost: $cost, shopName: $shopName, shopCity: $shopCity, shopLat: $shopLat, shopLong: $shopLong)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Product &&
        o.name == name &&
        o.image == image &&
        o.id == id &&
        o.isStared == isStared &&
        o.description == description &&
        o.distance == distance &&
        o.cost == cost &&
        o.shopName == shopName &&
        o.shopCity == shopCity &&
        o.shopLat == shopLat &&
        o.shopLong == shopLong;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        id.hashCode ^
        isStared.hashCode ^
        description.hashCode ^
        distance.hashCode ^
        cost.hashCode ^
        shopName.hashCode ^
        shopCity.hashCode ^
        shopLat.hashCode ^
        shopLong.hashCode;
  }
}
