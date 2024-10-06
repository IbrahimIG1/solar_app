import 'package:flutter/material.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/electrcity_load.dart/device_form_screen/device_form_calculaion.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/electrcity_load.dart/device_form_screen/device_panner_image.dart';

class DeviceCalculationScreen extends StatelessWidget {
  const DeviceCalculationScreen({
    super.key,
    required this.itemData,
    this.formKey,
  });
  final Map<String, dynamic> itemData;
  final Key? formKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemData['name']),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          DevicePannerImage(
            image: itemData['image'],
          ),
          verticalSpace(30),
          DeviceFormCalculaion(
            formKey: formKey,
            name: itemData['name'],
          ),
        ],
      ))),
    );
  }
}
