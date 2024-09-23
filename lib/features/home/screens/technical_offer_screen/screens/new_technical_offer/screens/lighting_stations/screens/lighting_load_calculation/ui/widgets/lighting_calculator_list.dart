import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/ui/widgets/lighting_calcolator_item.dart';

class LightingCalculatorList extends StatelessWidget {
  const LightingCalculatorList({super.key, required this.list});
  final List<String> list;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 18.w,
          children: List.generate(list.length, (index) {
            return InkWell(
                onTap: () {
                  if (index == list.length - 1) {
                    print("The Last one >> $index");
                  } else {
                    print('this index is $index = ${list[index]}');
                  }
                },
                child: LightingCalcolatorItem(image: list[index]));
          }),
        ),
      ),
    );
  }
}
