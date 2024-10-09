import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/dialogs/dialogs_status.dart';
import 'package:solar/features/home/screens/price_management/widgets/dialog_add_items_pricing.dart';
import 'package:solar/core/table/table_info.dart';
import 'package:solar/features/home/screens/price_offers/logic/cubit/price_offers_cubit.dart';
import 'package:solar/features/home/screens/price_offers/logic/cubit/price_offers_state.dart';
import 'package:solar/generated/l10n.dart';

class PriceManagement extends StatelessWidget {
  const PriceManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LightingCategoriesCalculationCubit,
        LightingCategoriesCalculationState>(
      listener: (context, state) {
        if (state is AddCategoriesDetailsSuccess) {
          doneDialog(context);
        } else if (state is AddCategoriesDetailsError) {
          errorDialog(context);
        }
      },
      builder: (context, state) {
        var cubit = LightingCategoriesCalculationCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(S.current.table_info),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (cubit.tableData.isNullOrEmpty())
                      Center(
                          child: Text(
                        "No Data Found",
                        style: TextStyles.font20GreyRegular,
                      )),
                    if (!cubit.tableData.isNullOrEmpty())
                      TableInfo(
                        tableData: cubit.tableData,
                      )
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AddItemPricingDialog(
                        saveData: () {
                          print("i'm here");
                          cubit.addDetailsDataToDatabase();
                        },
                        data: cubit.categoriesName,
                        categoryNameAdminController:
                            cubit.categoryNameAdminController,
                        typeController: cubit.typeAdminController,
                        capacityController: cubit.capacityAdminController,
                        priceController: cubit.priceAdminController,
                      );
                    });
              }),
        );
      },
    );
  }
}
