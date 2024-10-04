import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/core/widgets/main_item.dart';
import 'package:solar/generated/l10n.dart';

class PriceOffersScreen extends StatelessWidget {
  const PriceOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "id": "Price offers-2",
        'icon': 'assets/images/price_offers_screen/new_price.png',
        'name': S.current.new_price_offers,
        'width': 69.98.w,
        'height': 69.95.h,
      },
      {
        "id": "Price offers issued",
        'icon': 'assets/images/price_offers_screen/price_offer.png',
        'name': S.current.price_offers_issued,
        'width': 61.16.w,
        'height': 69.31.h,
      },
      {
        "id": "Maintenance-2",
        'icon': 'assets/images/price_offers_screen/stor_management.png',
        'name': S.current.maintenance,
        'width': 82.w,
        'height': 68.h,
      }
    ];
    List<String> screens = [
      Routes.newPriceOffersScreen,
      Routes.priceOffersIssuedScreen,
      "Routes.maintenanceScreen",
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
    ));
  }
}
