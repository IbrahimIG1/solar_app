import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/core/widgets/main_item.dart';
import 'package:solar/generated/l10n.dart';

class NewPriceOffers extends StatelessWidget {
  const NewPriceOffers({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        'icon': 'assets/images/sections_screen/light_icon.png',
        'name': S.current.lighting_stations,
        'width': 102.w,
        'height': 140.22.h,
      },
      {
        'icon': 'assets/images/sections_screen/surrface.png',
        'name': S.current.surface_irrigation_station,
        'width': 144.22.w,
        'height': 140.22.h,
      },
      {
        'icon': 'assets/images/sections_screen/deep.png',
        'name': S.current.deep_irrigation_station,
        'width': 144.22.w,
        'height': 140.22.h,
      }
    ];
    List<String> screens = [
      Routes.lightingStationsCategoriesScreen,
      "Surface irrigation stations",
      "Deep irrigation stations",
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainImage(
              arrowBacFunc: () {
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
        ),
      ),
    );
  }
}
