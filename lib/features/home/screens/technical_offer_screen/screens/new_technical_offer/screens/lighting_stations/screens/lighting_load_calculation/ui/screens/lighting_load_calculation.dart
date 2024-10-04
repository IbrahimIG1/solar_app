import 'package:flutter/material.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/ui/widgets/form_lighting_calculaion.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/ui/widgets/lighting_load_item_image.dart';

class LightingLoadCalculationScreen extends StatelessWidget {
  const LightingLoadCalculationScreen({
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
          LightingLoadItemImage(
            image: itemData['image'],
          ),
          verticalSpace(30),
          FormLightingCalculaion(
            formKey: formKey,
            name: itemData['name'],
          ),
        ],
      ))),
    );
  }
}
