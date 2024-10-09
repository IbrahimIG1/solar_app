// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:solar/core/models/inverter_model/inverter_data_model.dart';

class InverterModel {
  InverterModel(this.name, this.data);
  final String name;
  final  InverterDataModel data;

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'data': data.toMap(),
    };
  }

  factory InverterModel.fromMap(Map<String, dynamic> map) {
    return InverterModel(
      map['name'] as String,
      InverterDataModel.fromMap(map['data'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory InverterModel.fromJson(String source) => InverterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
