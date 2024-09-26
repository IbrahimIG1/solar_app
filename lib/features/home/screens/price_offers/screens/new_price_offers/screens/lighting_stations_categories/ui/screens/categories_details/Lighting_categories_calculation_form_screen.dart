import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/cubit/lighting_categories_calculation_cubit.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/cubit/lighting_categories_calculation_state.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/widgets/lighting_categories_form.dart';

class LightingCategoriesCalculationScreen extends StatelessWidget {
  const LightingCategoriesCalculationScreen({
    super.key,
    required this.data,
  });
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<LightingCategoriesCalculationCubit,
              LightingCategoriesCalculationState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = LightingCategoriesCalculationCubit.get(context);
              return Column(
                children: [
                  MainImage(arrowBacFunc: () {
                    context.pop();
                  }),
                  LightingCategoriesForm(
                      savePdf: () {
                        print("is_done before save in screen ${cubit.isDone}");
                        cubit.savePdf();
                        print("is_done after save in screen ${cubit.isDone}");
                      },
                      capacityController: cubit.capacityController,
                      numberController: cubit.numberController,
                      priceController: cubit.priceController,
                      typeController: cubit.typeController,
                      formKey: cubit.formKey,
                      data: data),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
