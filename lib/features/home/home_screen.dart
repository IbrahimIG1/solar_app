import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/widgets/main_image.dart';
import 'package:solar/core/widgets/widgets/main_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    testSentryError();
    List<Map<String, dynamic>> data = [
      {
        'icon': 'assets/images/screen_one/price_offer_icon.png',
        'e_name': "Price offers",
        'ar_name': "عروض أسعار",
      },
      {
        'icon': 'assets/images/screen_one/calculator_icon.png',
        'e_name': "Solar Equation",
        'ar_name': "معادلات الطاقه",
      },
      {
        'icon': 'assets/images/screen_one/settings_icon.png',
        'e_name': "Maintenance",
        'ar_name': "الصيانة",
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
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: MainItem(
                    routeName: Routes.secondScreen,
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

  Future<void> testSentryError() async {
    try {
      int? num;
      int result = num! + 1;
    } catch (exception, stackTrace) {
      print('exception');
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }
}
