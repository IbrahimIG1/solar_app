import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/cubit/lighting_categories_calculation_cubit.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/cubit/lighting_categories_calculation_state.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/widgets/item_card.dart';

class LightingStationsCategoriesScreen extends StatelessWidget {
  const LightingStationsCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body: SafeArea(
          child: BlocConsumer<LightingCategoriesCalculationCubit,
              LightingCategoriesCalculationState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = LightingCategoriesCalculationCubit.get(context);
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 18.w,
                        children: List.generate(cubit.data.length, (int index) {
                          return ItemCard(
                            isDone: cubit.savePdf(),
                            onTap: () {
                              if (index < cubit.data.length - 1) {
                                context.pushNamed(
                                    Routes.categoriesDetailsScreen,
                                    arguments: cubit.data[index]);
                              } else {
                                context.pushNamed(Routes.customerFormScreen);
                              }
                            },
                            index: index,
                            data: cubit.data[index],
                          );
                        }),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ));
  }
}
