import 'package:flutter/material.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/inverter_and_battery_calculation/widgets/form_calaculation.dart';

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
