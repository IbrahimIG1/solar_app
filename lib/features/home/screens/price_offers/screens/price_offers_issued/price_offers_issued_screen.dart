import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/di/di.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/cubit/lighting_categories_calculation_cubit.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/cubit/lighting_categories_calculation_state.dart';

class PriceOffersIssuedScreen extends StatelessWidget {
  const PriceOffersIssuedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Pdf"),
      ),
      body: SafeArea(
          child: BlocProvider(
        create: (context) =>
            LightingCategoriesCalculationCubit(getIt())..getAllPdf(),
        child: BlocConsumer<LightingCategoriesCalculationCubit,
                LightingCategoriesCalculationState>(
            listener: (context, state) {},
            builder: (context, snapshot) {
              var cubit = LightingCategoriesCalculationCubit.get(context);
              return Container(
                padding: EdgeInsets.only(top: 15.h),
                width: 1.sw,
                child: ListView.builder(
                  itemCount: cubit.pdfFiles.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      
                      onTap: () {
                        cubit.openPdf(cubit.pdfFiles[index].path);
                      },
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Icon(Icons.file_present_outlined),
                              horizontalSpace(5),
                              Text(
                                cubit.pdfFiles[index].path.split('/').last,
                                style: TextStyles.font16BlackRegular,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
      )),
    );
  }
}
