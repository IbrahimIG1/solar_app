import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/widgets/dialogs/dialogs_status.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/electrcity_load.dart/widgets/add_item_dialog.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/cubit/technical_offers_cubit.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/cubit/technical_offers_state.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/electrcity_load.dart/widgets/devices_list.dart';

class DevicesSceen extends StatelessWidget {
  const DevicesSceen({super.key});
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
              const DevicesList(),
            ],
          ),
        ),
      ),
      floatingActionButton:
          BlocConsumer<TechnicalOffersCubit, TechnicalOffersState>(
        listener: (context, state) {
          if (state is AddDatabaseStateSuccess) {
            doneDialog(context);
          } else if (state is AddDatabaseStateError) {
            errorDialog(context);
          }
        },
        builder: (context, state) {
          var cubit = TechnicalOffersCubit.get(context);
          return FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AddLightingItemDialog(
                        nameController: cubit.nameController,
                        addImage: cubit.getImage,
                        saveData: () {
                          cubit.addLightingData(
                              itemName: cubit.nameController.text,
                              itemImage: cubit.imagePath ?? "");
                        });
                  });

              // appShowBottomSheet(context);
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
