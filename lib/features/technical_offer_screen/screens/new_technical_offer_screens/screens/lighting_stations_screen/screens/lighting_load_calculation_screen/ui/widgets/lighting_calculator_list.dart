import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/features/technical_offer_screen/screens/new_technical_offer_screens/screens/lighting_stations_screen/screens/lighting_load_calculation_screen/logic/cubit/lighting_calculation_cubit.dart';
import 'package:solar/features/technical_offer_screen/screens/new_technical_offer_screens/screens/lighting_stations_screen/screens/lighting_load_calculation_screen/logic/cubit/lighting_calculation_state.dart';
import 'package:solar/features/technical_offer_screen/screens/new_technical_offer_screens/screens/lighting_stations_screen/screens/lighting_load_calculation_screen/ui/widgets/lighting_calcolator_item.dart';

class LightingCalculatorList extends StatelessWidget {
  const LightingCalculatorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<LightingCalculationCubit, LightingCalculationState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            LightingCalculationCubit cubit =
                LightingCalculationCubit.get(context);
            var data = cubit.lightingIconsList;
            if (cubit.lightingIconsList.isEmpty) {
              return const Center(child: Text("No Data Yet!, Please Add Data"));
            } else {
              return GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 18.w,
                children: List.generate(data.length, (index) {
                  return GestureDetector(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        cubit.deleteDatabase(data[index]['id']);
                                        context.pop();
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyles.font25BlackRegular
                                            .copyWith(color: Colors.red),
                                      ))
                                ],
                              ),
                            );
                          },
                        );
                      },
                      onTap: () {
                        context.pushNamed(Routes.lightingLoadCalculation,
                            arguments: data[index]);
                      },
                      child: LightingCalcolatorItem(
                        image: data[index]['icon'],
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
