import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryDetailsModel {
  String type;
  String capacity;
  String price;
  String categoryName;
  CategoryDetailsModel({
    required this.type,
    required this.capacity,
    required this.price,
    required this.categoryName,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'capacity': capacity,
      'price': price,
      'category_name': categoryName,
    };
  }

  factory CategoryDetailsModel.fromMap(Map<String, dynamic> map) {
    return CategoryDetailsModel(
      type: map['type'] as String,
      capacity: map['capacity'] as String,
      price: map['price'] as String,
      categoryName: map['category_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryDetailsModel.fromJson(String source) => CategoryDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
