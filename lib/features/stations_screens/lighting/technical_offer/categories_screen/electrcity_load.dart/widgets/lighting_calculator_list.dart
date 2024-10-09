import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/dialogs/dialogs_status.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/cubit/technical_offers_cubit.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/cubit/technical_offers_state.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/electrcity_load.dart/widgets/device_card.dart';

class DevicesList extends StatelessWidget {
  const DevicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<TechnicalOffersCubit, TechnicalOffersState>(
          listener: (context, state) {},
          builder: (context, state) {
            TechnicalOffersCubit cubit = TechnicalOffersCubit.get(context);
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
                      child: DeviceCard(
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
