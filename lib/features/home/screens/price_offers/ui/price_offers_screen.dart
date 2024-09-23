import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/router_check.dart';
import 'package:solar/core/widgets/widgets/main_image.dart';
import 'package:solar/core/widgets/widgets/main_item.dart';

class PriceOffersScreen extends StatelessWidget {
  const PriceOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "id": "Price offers-2",
        'icon': 'assets/images/price_offers_screen/new_price.png',
        'e_name': "New Price offers",
        'ar_name': "عرض سعر جديد",
      },
      {
        "id": "Price offers issued",
        'icon': 'assets/images/price_offers_screen/price_offer.png',
        'e_name': "Price offers issued",
        'ar_name': "عروض الاسعار الصادره",
      },
      {
        "id": "Maintenance-2",
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
}
