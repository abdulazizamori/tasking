import 'dart:convert';

class EcommerceModel {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  DateTime? creationAt;
  DateTime? updatedAt;
  Category? category;

  EcommerceModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  factory EcommerceModel.fromRawJson(String str) {
    try {
      return EcommerceModel.fromJson(json.decode(str));
    } catch (e) {
      throw FormatException("Invalid JSON: $e");
    }
  }

  String toRawJson() => json.encode(toJson());

  factory EcommerceModel.fromJson(Map<String, dynamic> json) => EcommerceModel(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    images: json["images"] == null ? [] : List<String>.from(json["images"].map((x) => x)),
    creationAt: json["creationAt"] == null ? null : DateTime.tryParse(json["creationAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.tryParse(json["updatedAt"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "creationAt": creationAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "category": category?.toJson(),
  };

  // Updated method to parse a List<EcommerceModel>
  static List<EcommerceModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((data) => EcommerceModel.fromJson(data)).toList();
  }
}

class Category {
  int? id;
  Name? name;
  String? image;
  DateTime? creationAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory Category.fromRawJson(String str) {
    try {
      return Category.fromJson(json.decode(str));
    } catch (e) {
      throw FormatException("Invalid JSON: $e");
    }
  }

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: nameValues.map[json["name"]] ?? Name.MISCELLANEOUS, // Defaulting to MISCELLANEOUS if null or unknown
    image: json["image"],
    creationAt: json["creationAt"] == null ? null : DateTime.tryParse(json["creationAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.tryParse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "image": image,
    "creationAt": creationAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

enum Name { ELECTRONICS, FURNITURE, MISCELLANEOUS, NUEVO, SHOES }

final nameValues = EnumValues({
  "Electronics": Name.ELECTRONICS,
  "Furniture": Name.FURNITURE,
  "Miscellaneous": Name.MISCELLANEOUS,
  "nuevo": Name.NUEVO,
  "Shoes": Name.SHOES
});

class EnumValues<T> {
  final Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
