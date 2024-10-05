import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/delete_box.dart';
import 'package:solar/core/widgets/dialogs/dialogs_status.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/cubit/lighting_calculation_cubit.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/cubit/lighting_calculation_state.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/ui/widgets/lighting_calcolator_item.dart';

class LightingCalculatorList extends StatelessWidget {
  const LightingCalculatorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<LightingCalculationCubit, LightingCalculationState>(
          listener: (context, state) {},
          builder: (context, state) {
            LightingCalculationCubit cubit =
                LightingCalculationCubit.get(context);
            List<Map<String, dynamic>> data = cubit.itemsList;
            if (cubit.itemsList.isEmpty) {
              cubit.getLightingData();
              return const Center(child: Text("No Data Yet!, Please Add Data"));
            } else {
              return GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 18.w,
                children: List.generate(data.length, (index) {
                  return GestureDetector(
                      onLongPress: () {
                        deleteDialog(
                          context,
                          () {
                            cubit.deleteData(id: data[index]['id']);
                            context.pop();
                          },
                        );
                      },
                      onTap: () {
                        context.pushNamed(Routes.lightingLoadCalculation,
                            arguments: data[index]);
                      },
                      child: LightingCalcolatorItem(
                        image: data[index]['image'],
                      ));
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
