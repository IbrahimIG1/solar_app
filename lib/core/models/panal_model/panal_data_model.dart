// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PanalDataModel {
  final List pmax;
  final List voc;
  final List isc;
  final List vmp;
  final List imp;
  PanalDataModel(
      {required this.pmax,
      required this.voc,
      required this.isc,
      required this.vmp,
      required this.imp});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pmax': pmax,
      'voc': voc,
      'isc': isc,
      'vmp': vmp,
      'imp': imp,
    };
  }

  factory PanalDataModel.fromMap(Map<String, dynamic> map) {
    return PanalDataModel(
      pmax: List.from((map['pmax'] as List)),
      voc: List.from((map['voc'] as List)),
      isc: List.from((map['isc'] as List)),
      vmp: List.from((map['vmp'] as List)),
      imp: List.from((map['imp'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory PanalDataModel.fromJson(String source) =>
      PanalDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
