import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/router_check.dart';
import 'package:solar/core/widgets/widgets/main_image.dart';
import 'package:solar/core/widgets/widgets/main_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // testSentryError();
    List<Map<String, dynamic>> data = [
      {
        "id": "Price offers-1",
        'icon': 'assets/images/home_screen/price_offer_icon.png',
        'e_name': "Price offers",
        'ar_name': "عروض أسعار",
        'width': 60.w,
        'height': 60.h,
      },
      {
        "id": "Technical offer",
        'icon': 'assets/images/home_screen/calculator_icon.png',
        'e_name': "Technical offer",
        'ar_name': "العرض الفني",
        'width': 52.w,
        'height': 65.h,
      },
      {
        "id": "Maintenance-1",
        'icon': 'assets/images/home_screen/settings_icon.png',
        'e_name': "Maintenance",
        'ar_name': "الصيانة",
        'width': 65.w,
        'height': 65.h,
      },
      {
        "id": "customer Base",
        'icon': 'assets/images/home_screen/customer_base_icon.png',
        'e_name': "customer Base",
        'ar_name': "قاعدة العملاء",
        'width': 90.w,
        'height': 94.91.h,
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
                    routeName: checkRoutNameNaviigation(data[index]['id']),
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
