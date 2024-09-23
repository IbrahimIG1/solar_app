import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/router_check.dart';
import 'package:solar/core/widgets/widgets/main_image.dart';
import 'package:solar/core/widgets/widgets/main_item.dart';

class NewPriceOffers extends StatelessWidget {
  const NewPriceOffers({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "id": "Lighting stations",
        'icon': 'assets/images/sections_screen/light_icon.png',
        'e_name': "Lighting stations",
        'ar_name': "محطات انارة",
      },
      {
        "id": "Surface irrigation stations",
        'icon': 'assets/images/sections_screen/surrface.png',
        'e_name': "Surface irrigation stations",
        'ar_name': "محطات ري سطحي",
      },
      {
        "id": "Deep irrigation stations",
        'icon': 'assets/images/sections_screen/deep.png',
        'e_name': "Deep irrigation stations",
        'ar_name': "محطات ري عميق",
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
