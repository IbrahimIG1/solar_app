import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/features/price_offers/screens/new_price_offers_Categories_screen/screens/lighting_stations_screen/widgets/item_card.dart';
import '../../../../../../core/widgets/main_image.dart';

class LightingStationsCategoriesScreen extends StatelessWidget {
  const LightingStationsCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        'first_name': 'Panel Type',
        'second_name': "panel watt",
        'thired_name': "Number of panels",
        'forth_name': "panal Type",
        'first_choose': "اللوح",
        'second_choose': "وات اللوح",
        'thired_choose': "عدد الالواح",
        'icon': 'assets/images/categories_icons/sun_electric.png',
        'width': 130.w,
        'height': 92.28.h,
      },
      {
        'first_name': 'Inverter Type',
        'second_name': "Inverter capacity",
        'thired_name': "Inverter price",
        'forth_name': "panal Type",
        'first_choose': "الشاسيه",
        'second_choose': "معدن الشاسيه",
        'thired_choose': "سعر الانفرتر",
        'icon': 'assets/images/categories_icons/power_generator.png',
        'width': 96.w,
        'height': 112.h,
      },
      {
        'first_name': 'Chassis type',
        'second_name': "Type of chassis metal",
        'thired_name': "Chassis price",
        'forth_name': "panal Type",
        'first_choose': "اللوح",
        'second_choose': "وات",
        'thired_choose': "سعر الشاسية",
        'icon': 'assets/images/categories_icons/sun_battery.png',
        'width': 110.w,
        'height': 92.48.h,
      },
      {
        'first_name': 'Panel Type',
        'second_name': "panel watt",
        'thired_name': "Number of panels",
        'forth_name': "panal Type",
        'first_choose': "اللوح",
        'second_choose': "وات اللوح",
        'thired_choose': "عدد الالواح",
        'icon': 'assets/images/categories_icons/stand_sun.png',
        'width': 130.w,
        'height': 106.41.h,
      },
      {
        'first_name': 'Panel Type',
        'second_name': "panel watt",
        'thired_name': "Number of panels",
        'forth_name': "panal Type",
        'first_choose': "اللوح",
        'second_choose': "وات اللوح",
        'thired_choose': "عدد الالواح",
        'icon': 'assets/images/categories_icons/sun_system.png',
        'width': 120.w,
        'height': 115.12.h,
      },
      {
        'first_name': 'Panel Type',
        'second_name': "panel watt",
        'thired_name': "Number of panels",
        'forth_name': "panal Type",
        'first_choose': "اللوح",
        'second_choose': "وات اللوح",
        'thired_choose': "عدد الالواح",
        'icon': 'assets/images/categories_icons/car_electric.png',
        'width': 144.22.w,
        'height': 140.22.h,
      },
      // {
      //   'first_name': 'Panel Type',
      //   'second_name': "panel watt",
      //   'thired_name': "Number of panels",
      //   'forth_name': "panal Type",
      //   'first_choose': "اللوح",
      //   'second_choose': "وات",
      //   'thired_choose': "عدد الالواح",
      //   'icon': 'assets/images/categories_icons/settings.png',
      //   'width': 100.w,
      //   'height': 100.h,
      // },
      {
        'first_name': 'Panel Type',
        'second_name': "panel watt",
        'thired_name': "Number of panels",
        'forth_name': "panal Type",
        'first_choose': "اللوح",
        'second_choose': "وات",
        'thired_choose': "عدد الالواح",
        'icon': 'assets/images/categories_icons/profile.png',
        'width': 95.22.w,
        'height': 100.h,
      },
    ];

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          MainImage(arrowBacFunc: () {
            context.pop();
          }),
          verticalSpace(30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 18.w,
                children: List.generate(data.length, (index) {
                  return ItemCard(
                    onTap: () {
                      context.pushNamed(Routes.categoriesDetailsScreen,
                          arguments: data[index]);
                    },
                    index: index,
                    data: data,
                  );
                }),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
