// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InverterDataModel {
  final List modelInverter;
  final List input1DC;
  final List input2DC;
  final List maxInputDC;
  final List ratedOutputCurrent;
  InverterDataModel(
      {required this.modelInverter,
      required this.input1DC,
      required this.input2DC,
      required this.maxInputDC,
      required this.ratedOutputCurrent});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'model_inverter': modelInverter,
      'input_1dc': input1DC,
      'input_2dc': input2DC,
      'max_input_dc': maxInputDC,
      'rated_output_current': ratedOutputCurrent,
    };
  }

  factory InverterDataModel.fromMap(Map<String, dynamic> map) {
    return InverterDataModel(
      modelInverter: List.from((map['model_inverter'] as List)),
      input1DC: List.from((map['input_1dc'] as List)),
      input2DC: List.from((map['input_2dc'] as List)),
      maxInputDC: List.from((map['max_input_dc'] as List)),
      ratedOutputCurrent: List.from((map['rated_output_current'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory InverterDataModel.fromJson(String source) =>
      InverterDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
