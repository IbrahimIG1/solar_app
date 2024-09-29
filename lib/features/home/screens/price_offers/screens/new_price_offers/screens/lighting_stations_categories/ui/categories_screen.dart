import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/models/app_categories.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/cubit/lighting_categories_calculation_cubit.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/cubit/lighting_categories_calculation_state.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/widgets/item_card.dart';
import 'package:solar/generated/l10n.dart';

class LightingStationsCategoriesScreen extends StatefulWidget {
  const LightingStationsCategoriesScreen({super.key});

  @override
  State<LightingStationsCategoriesScreen> createState() =>
      _LightingStationsCategoriesScreenState();
}

class _LightingStationsCategoriesScreenState
    extends State<LightingStationsCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.current.categories),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 18.w,
                      children: List.generate(
                          AppCategories.lightingItemsData.length, (int index) {
                        return ItemCard(
                          isDone: AppCategories.lightingItemsData[index]
                              ['is_done'],
                          onTap: () async {
                            if (index <
                                AppCategories.lightingItemsData.length - 1) {
                              //* i'm await on push because i wait the result in navigate.pop(is_done)
                              //* to active the check is done on item
                              final result = await context.pushNamed(
                                  Routes.categoriesDetailsScreen,
                                  arguments:
                                      AppCategories.lightingItemsData[index]);
                              if (result != null) {
                                setState(() {
                                  AppCategories.lightingItemsData[index]
                                      ['is_done'] = result;
                                });
                              }
                            } else {
                              context.pushNamed(Routes.customerFormScreen);
                            }
                          },
                          index: index,
                          data: AppCategories.lightingItemsData[index],
                        );
                      }),
                    ),
                  ),
                ),
                BlocConsumer<LightingCategoriesCalculationCubit,
                    LightingCategoriesCalculationState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = LightingCategoriesCalculationCubit.get(context);
                    return AppTextButton(
                      text: S.current.extract_pdf,
                      onpressed: () {
                        cubit.pdfGenerate();
                      },
                      backgroundColor: Colors.green,
                      buttonWidth: double.infinity,
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
