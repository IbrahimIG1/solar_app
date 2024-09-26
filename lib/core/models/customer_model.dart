// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomerModel {
  final String customerName;
  final String customerAddress;
  final String customerPhone;
  final String stationType;
  final String offerExpiryDate;
  CustomerModel(this.customerName, this.customerPhone, this.stationType,
      this.offerExpiryDate, this.customerAddress);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customer_name': customerName,
      'customer_address': customerAddress,
      'customer_phone': customerPhone,
      'stationp_type': stationType,
      'offer_expiry_date': offerExpiryDate,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      map['customer_name'] as String,
      map['customer_address'] as String,
      map['customer_phone'] as String,
      map['stationp_type'] as String,
      map['offer_expiry_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) => CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
