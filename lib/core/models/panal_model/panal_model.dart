// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:solar/core/models/panal_model/panal_data_model.dart';

class PanalModel {
  PanalModel(this.name, this.data);
  final String name;
  final  PanalDataModel data;

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'data': data.toMap(),
    };
  }

  factory PanalModel.fromMap(Map<String, dynamic> map) {
    return PanalModel(
      map['name'] as String,
      PanalDataModel.fromMap(map['data'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PanalModel.fromJson(String source) => PanalModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
