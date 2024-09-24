import 'package:flutter/material.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/features/technical_offer_screen/screens/new_technical_offer_screens/screens/lighting_stations_screen/screens/inverter_and_battery_calculation_screen/widgets/inverter_and_battery_calculation_form_screen.dart';

class InverterAndBatteryCalculation extends StatelessWidget {
  const InverterAndBatteryCalculation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainImage(arrowBacFunc: () {
              context.pop();
            }),
            const FormCalaculation(),
          ],
        ),
      )),
    );
  }
}
