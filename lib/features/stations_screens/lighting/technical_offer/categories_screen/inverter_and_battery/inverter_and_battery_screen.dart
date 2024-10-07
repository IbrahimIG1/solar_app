import 'package:flutter/material.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/inverter_and_battery/form_calaculation.dart';

class InverterAndBatteryScreen extends StatelessWidget {
  const InverterAndBatteryScreen({super.key});

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
            verticalSpace(20),
            const FormCalaculation(),
          ],
        ),
      )),
    );
  }
}
