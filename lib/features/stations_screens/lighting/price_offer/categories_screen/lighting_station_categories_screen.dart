import 'package:flutter/material.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/features/stations_screens/lighting/price_offer/categories_screen/widgets/lighting_station_categories_form.dart';

class LightingStationCategoriesScreen extends StatelessWidget {
  const LightingStationCategoriesScreen({
    super.key,
    required this.data,
  });
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainImage(arrowBacFunc: () {
                context.pop();
              }),
              LightingCategoriesForm(
                data: data,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
