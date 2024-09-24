import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/core/widgets/main_item.dart';

class NewTechnicalOffers extends StatelessWidget {
  const NewTechnicalOffers({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "id": "Technical Lighting stations",
        'icon': 'assets/images/sections_screen/light_icon.png',
        'e_name': "Lighting stations",
        'ar_name': "محطات انارة",
        'width': 155.22.w,
        'height': 60.22.h,
      },
      {
        "id": "Technical irrigation stations",
        'icon': 'assets/images/technical_offers/irrigation_stations.png',
        'e_name': "irrigation stations",
        'ar_name': "محطات ري ",
        'width': 155.22.w,
        'height': 60.22.h,
      },
    ];
    List<String> screens = [
      Routes.technicalLightingStations,
      "Routes.technicalIrrigationStations",
    ];
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          MainImage(
            arrowBacFunc: () {
              print('clicked');
              // context.pushNamedAndRemoveUntil(
              //   Routes.homeScreen,
              //   predicate: (route) => false,
              // );
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
