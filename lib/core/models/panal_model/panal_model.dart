// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:solar/core/models/panal_model/panal_data_model.dart';

class PanalModel {
  PanalModel(this.data);
  final PanalDataModel data;

  // Map<String, List<Map<String, List>>>
  Map<String, dynamic> toMap() {
    return {
      "data": data.toMap(),
    };
  }

  factory PanalModel.fromMap(Map<String, dynamic> map) {
    return PanalModel(
      PanalDataModel.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PanalModel.fromJson(String source) =>
      PanalModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
