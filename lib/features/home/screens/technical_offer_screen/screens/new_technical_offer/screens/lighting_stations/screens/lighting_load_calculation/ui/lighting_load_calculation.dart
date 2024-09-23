import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/widgets/widgets/main_image.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/cubit/lighting_calculation_cubit.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/cubit/lighting_calculation_state.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/ui/widgets/lighting_calculator_list.dart';

class LightingLoadCalculation extends StatelessWidget {
  const LightingLoadCalculation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LightingCalculationCubit, LightingCalculationState>(
          listener: (context, state) {},
          builder: (context, state) {
            LightingCalculationCubit cubit =
                LightingCalculationCubit.get(context);
            print(cubit.lightingIconsList.length);
            if (state is GetDatabaseStateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Column(
                  children: [
                    MainImage(arrowBacFunc: () {
                      context.pop();
                    }),
                    verticalSpace(25),
                    LightingCalculatorList(list: cubit.lightingIconsList),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
