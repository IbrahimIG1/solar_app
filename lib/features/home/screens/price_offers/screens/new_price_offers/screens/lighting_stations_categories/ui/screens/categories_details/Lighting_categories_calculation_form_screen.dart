import 'package:flutter/material.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/widgets/lighting_categories_form.dart';

class LightingCategoriesCalculationScreen extends StatelessWidget {
  const LightingCategoriesCalculationScreen({
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
