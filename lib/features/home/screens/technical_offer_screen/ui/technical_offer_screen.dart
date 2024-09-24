import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/widgets/main_image.dart';
import 'package:solar/core/widgets/widgets/main_item.dart';

class TechnicalOfferScreen extends StatelessWidget {
  const TechnicalOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "id": "New Technical offer",
        'icon': 'assets/images/price_offers_screen/new_price.png',
        'e_name': "New Technical offer",
        'ar_name': "عرض فني جديد",
        'width': 69.98.w,
        'height': 69.95.h,
      },
      {
        "id": "Technical offers issued",
        'icon': 'assets/images/price_offers_screen/price_offer.png',
        'e_name': "Technical offers issued",
        'ar_name': 'العروض الفنية الصادرة',
        'width': 61.16.w,
        'height': 69.31.h,
      },
      {
        "id": "Store Management",
        'icon': 'assets/images/price_offers_screen/stor_management.png',
        'e_name': "Store Management",
        'ar_name': "ادارة المخزون",
        'width': 82.w,
        'height': 68.h,
      }
    ];
    List<String> screens = [
      Routes.newTechnicalOffers,
      "Routes.technicalOffersIssued",
      "Routes.StoreManagement",
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
