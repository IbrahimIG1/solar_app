import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/widgets/main_image.dart';
import 'package:solar/core/widgets/widgets/main_item.dart';

class PriceOffersScreen extends StatelessWidget {
  const PriceOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        'icon': 'assets/images/price_offers_screen/new_price.png',
        'e_name': "Price offers",
        'ar_name': "عرض سعر جديد",
      },
      {
        'icon': 'assets/images/price_offers_screen/price_offer.png',
        'e_name': "Solar Equation",
        'ar_name': "عروض الاسعار الصادره",
      },
      {
        'icon': 'assets/images/price_offers_screen/stor_management.png',
        'e_name': "Maintenance",
        'ar_name': "ادارة المخزن",
      }
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
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: MainItem(
                    routeName: Routes.sectionsScreen,
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
