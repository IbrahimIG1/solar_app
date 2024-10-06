import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/core/widgets/app_drop_down_button.dart';
import 'package:solar/features/home/screens/price_offers/logic/cubit/price_offers_cubit.dart';
import 'package:solar/features/home/screens/price_offers/logic/cubit/price_offers_state.dart';
import 'package:solar/core/widgets/text_and_text_field.dart';

class LightingCategoriesForm extends StatelessWidget {
  const LightingCategoriesForm({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LightingCategoriesCalculationCubit,
        LightingCategoriesCalculationState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LightingCategoriesCalculationCubit.get(context);
        final GlobalKey<FormState> formKey = cubit.formKey;
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['first_name'],
                  style: TextStyles.font25BlackRegular,
                ),
                AppDropDownButton(
                    data: cubit.typeNamesList,
                    onSelecte: (value) {
                      cubit.dropDownTypeValue = value;
                      cubit.valueSelected();
                    }),
                verticalSpace(20),
                Text(
                  data['second_name'],
                  style: TextStyles.font25BlackRegular,
                ),
                AppDropDownButton(
                    data: cubit.capaciyNamesList,
                    onSelecte: (value) {
                      cubit.dropDownCapacityValue = value;
                      cubit.valueSelected();
                    }),
                verticalSpace(20),
                TextAndTextFeild(
                  keboardType: TextInputType.number,
                  controller: cubit.categoryNumberController,
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return "Please Enter the price";
                    }
                  },
                  hintText: "أدخل عدد الالواح",
                  name: data['thired_name'],
                ),
                verticalSpace(20),
                TextAndTextFeild(
                  keboardType: TextInputType.number,
                  controller: cubit.priceController,
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return "Please Enter the number";
                    }
                  },
                  hintText: 'أدخل السعر',
                  name: data['forth_name'],
                ),
                verticalSpace(20),
                Center(
                  child: AppTextButton(
                      text: 'Save',
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.savePdfContent(context);
                          print("ckiked");
                        }
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
