import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/core/widgets/main_item.dart';
import 'package:solar/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // testSentryError();
    List<Map<String, dynamic>> data = [
      {
        "id": "Price offers-1",
        'icon': 'assets/images/home_screen/price_offer_icon.png',
        'name': S.current.price_offers,
        'width': 60.w,
        'height': 60.h,
      },
      {
        "id": "Technical offer",
        'icon': 'assets/images/home_screen/calculator_icon.png',
        'name': S.current.technical_offer,
        'width': 52.w,
        'height': 65.h,
      },
      {
        "id": "Maintenance-1",
        'icon': 'assets/images/home_screen/settings_icon.png',
        'name': S.current.maintenance,
        'width': 65.w,
        'height': 65.h,
      },
      {
        "id": "customer Base",
        'icon': 'assets/images/home_screen/customer_base_icon.png',
        'name': S.current.customers_data,
        'width': 90.w,
        'height': 94.91.h,
      },
      {
        "id": "customer Base",
        'icon': 'assets/images/home_screen/dollar_icon.png',
        'name': S.current.prices_database,
        'width': 90.w,
        'height': 90.h,
      }
    ];
    List<String> screens = [
      Routes.priceOffersScreen,
      Routes.technicalOfferScreen,
      "Routes.maintenanceScreen",
      Routes.customerBaseScreen,
      Routes.priceManagement,
    ];
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          MainImage(
            arrowBacFunc: () {},
          ),
          verticalSpace(10),
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

  // Future<void> testSentryError() async {
  //   try {
  //     int? num;
  //     int result = num! + 1;
  //   } catch (exception, stackTrace) {
  //     print('exception');
  //     await Sentry.captureException(
  //       exception,
  //       stackTrace: stackTrace,
  //     );
  //   }
  // }
}
