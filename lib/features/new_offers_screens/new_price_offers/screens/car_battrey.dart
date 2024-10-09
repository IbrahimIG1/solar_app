import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/features/home/screens/price_offers/logic/cubit/price_offers_cubit.dart';
import 'package:solar/features/home/screens/price_offers/logic/cubit/price_offers_state.dart';
import 'package:solar/core/widgets/text_and_text_field.dart';

class CarBattrey extends StatelessWidget {
  const CarBattrey({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LightingCategoriesCalculationCubit,
        LightingCategoriesCalculationState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LightingCategoriesCalculationCubit.get(context);
        final GlobalKey<FormState> formKey = cubit.formKey;
        return Scaffold(
          appBar: AppBar(
            title: Text('Car & Battery'),
          ),
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextAndTextFeild(
                      keboardType: TextInputType.number,
                      // controller: cubit.priceController,
                      validator: (value) {
                        if (value.isNullOrEmpty()) {
                          return "Please Enter the number";
                        }
                      },
                      hintText: "",
                      name: "Transportation cost",
                    ),
                    verticalSpace(20),
                    TextAndTextFeild(
                      keboardType: TextInputType.number,
                      // controller: cubit.priceController,
                      validator: (value) {
                        if (value.isNullOrEmpty()) {
                          return "Please Enter the number";
                        }
                      },
                      hintText: "",
                      name: "Installation cost",
                    ),
                    // verticalSpace(20),
                    // Center(
                    //   child: AppTextButton(
                    //       text: 'Save',
                    //       onpressed: () {
                    //         if (formKey.currentState!.validate()) {
                    //           // cubit.savePdfContent(data, context);
                    //           print("ckiked");
                    //         }
                    //       }),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
