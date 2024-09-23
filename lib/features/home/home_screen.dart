import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/widgets/main_image.dart';
import 'package:solar/core/widgets/widgets/main_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // testSentryError();
    List<Map<String, dynamic>> data = [
      {
        'icon': 'assets/images/home_screen/price_offer_icon.png',
        'e_name': "Price offers",
        'ar_name': "عروض أسعار",
      },
      {
        'icon': 'assets/images/home_screen/calculator_icon.png',
        'e_name': "Technical offer",
        'ar_name': "العرض الفني",
      },
      {
        'icon': 'assets/images/home_screen/settings_icon.png',
        'e_name': "Maintenance",
        'ar_name': "الصيانة",
      },
      {
        'icon': 'assets/images/home_screen/customer_base_icon.png',
        'e_name': "customer Base",
        'ar_name': "قاعدة العملاء",
      }
    ];
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          MainImage(
            arrowBacFunc: () {},
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
                    routeName: checkRoutNameNaviigation(data[index]['e_name']),
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

  String checkRoutNameNaviigation(String screenName) {
    switch (screenName) {
      case 'Price offers':
        return Routes.priceOffersScreen;
      case 'Technical offer':
        return Routes.technicalOfferScreen;
      case 'Maintenance':
        return Routes.technicalOfferScreen;
      case 'customer Base':
        return Routes.technicalOfferScreen;
      default:
        return '';
    }
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
