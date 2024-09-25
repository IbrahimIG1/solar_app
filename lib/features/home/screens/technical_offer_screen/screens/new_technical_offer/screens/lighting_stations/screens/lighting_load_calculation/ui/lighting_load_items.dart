import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/widgets/dialog.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/cubit/lighting_calculation_cubit.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/cubit/lighting_calculation_state.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/ui/widgets/lighting_calculator_list.dart';

class LightingLoadItems extends StatelessWidget {
  const LightingLoadItems({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              MainImage(arrowBacFunc: () {
                context.pop();
              }),
              verticalSpace(25),
              const LightingCalculatorList(),
            ],
          ),
        ),
      ),
      floatingActionButton:
          BlocConsumer<LightingCalculationCubit, LightingCalculationState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LightingCalculationCubit.get(context);
          return FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AppDialog(
                        nameController: cubit.nameController,
                        addImage: cubit.getImage,
                        saveData: () {
                          cubit.addLightingData(
                              itemName: cubit.nameController.text,
                              itemImage: cubit.imagePath ?? "");
                        });
                  });
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
