import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/core/widgets/main_item.dart';
import 'package:solar/generated/l10n.dart';

class TechLightingStationScreen extends StatelessWidget {
  const TechLightingStationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "id": "Lighting load calculation",
        'icon': 'assets/images/technical_offers/home_power_icon.png',
        'name': S.current.lighting_load_calculation,
        'width': 110.w,
        'height': 90.h,
      },
      {
        "id": "inverter and battery calculation",
        'icon': 'assets/images/technical_offers/inventer_and_pattery_group.png',
        'name': S.current.calculation_inverter_and_batteries,
        'width': 306.w,
        'height': 90.h,
      },
    ];
    List<String> screens = [
      Routes.lightingLoadItem,
      Routes.inverterAndBatteryCalculation,
    ];
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          MainImage(
            arrowBacFunc: () {
              print('clicked');
              context.pop();
            },
          ),
          verticalSpace(30),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: MainItem(
                    routeName: screens[index],
                    data: data,
                    index: index,
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
