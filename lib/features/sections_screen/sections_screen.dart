import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/widgets/main_image.dart';
import 'package:solar/core/widgets/widgets/main_item.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        'icon': 'assets/images/sections_screen/light_icon.png',
        'e_name': "Lighting stations",
        'ar_name': "محطات انارة",
      },
      {
        'icon': 'assets/images/sections_screen/surrface.png',
        'e_name': "Surface irrigation stations",
        'ar_name': "محطات ري سطحي",
      },
      {
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
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: MainItem(
                    routeName: Routes.categoriesScreen,
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
