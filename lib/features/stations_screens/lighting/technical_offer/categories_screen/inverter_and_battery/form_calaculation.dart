import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/core/widgets/app_drop_down_button.dart';
import 'package:solar/core/widgets/app_text_feild.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/inverter_and_battery/cubit/inverter_and_battery_cubit.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/inverter_and_battery/cubit/inverter_and_battery_state.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/inverter_and_battery/widgets/text_up_drop_down_button.dart';
import 'package:solar/generated/l10n.dart';

class FormCalaculation extends StatelessWidget {
  const FormCalaculation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InverterAndBatteryCubit, InverterAndBatteryState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = InverterAndBatteryCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: cubit.formKey,
                child: AppTextFormFeild(
                    keyboardType: TextInputType.number,
                    hintText: "Load(WH) أدخل قدرة الماتور بالحصان",
                    controller: cubit.loadWHController,
                    validator: (value) {
                      if (value.isNullOrEmpty()) {
                        return "please Enter hourse Power number";
                      }
                    }),
              ),
              verticalSpace(20),
              textAboveDrowpDownButton("Inverter Type"),
              AppDropDownButton(
                  data: cubit.inverterTypeList,
                  onSelecte: (value) {
                    cubit.getInverters(inverterName: value);
                  }),
              verticalSpace(20),
              textAboveDrowpDownButton("Panel Type"),
              AppDropDownButton(
                  data: cubit.panalTypeList,
                  onSelecte: (value) {
                    cubit.getpanals(panalName: value);
                  }),
              verticalSpace(20),
              if (!cubit.panals.isNullOrEmpty())
                textAboveDrowpDownButton("Panel (Wh)"),
              AppDropDownButton(data: const [''], onSelecte: (value) {}),
              verticalSpace(20),
              Center(
                  child: AppTextButton(
                      textStyle: TextStyles.font25BlackRegular
                          .copyWith(color: Colors.white),
                      text: S.current.save,
                      onpressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          // List<double> modelsInverter =
                          //     cubit.inverters['data']['model_inverter'];
                          // print("Panals Values is >> ${cubit.panals}");
                          // print("Inverters Models is >> $modelsInverter");
                          // modelsInverter.forEach((element)
                          // {

                          // });
                          cubit.allCalculation();
                        }
                      })),
              // Center(
              //   child: Text((cubit
              //       .closestValue(
              //           double.parse(cubit.loadWHController.text.toString()))
              //       .toString()) ),
              // )
            ],
          ),
        );
      },
    );
  }
}
