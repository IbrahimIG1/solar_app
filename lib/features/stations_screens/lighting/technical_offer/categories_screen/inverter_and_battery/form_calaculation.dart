import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/constance/constance.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/core/widgets/app_drop_down_button.dart';
import 'package:solar/core/widgets/app_text_feild.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/inverter_and_battery/cubit/inverter_and_battery_cubit.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/inverter_and_battery/cubit/inverter_and_battery_state.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/inverter_and_battery/widgets/text_up_drop_down_button.dart';

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
              AppTextFormFeild(
                  keyboardType: TextInputType.number,
                  hintText: "Load(WH) أدخل قدرة الماتور بالحصان",
                  controller: cubit.loadWHController,
                  validator: (value) {}),
              verticalSpace(20),
              textAboveDrowpDownButton("Inverter Type"),
              AppDropDownButton(
                  data: cubit.inverterTypeList,
                  onSelecte: (value) {
                    cubit.inverterTypeDropdownValue = value;
                    cubit.getInvertersData(
                        collectionName: value,
                        collection: inverterCollection,
                        docUid: inverterUid);
                  }),
              verticalSpace(20),
              textAboveDrowpDownButton("Panel Type"),
              AppDropDownButton(
                  data: cubit.panalTypeList,
                  onSelecte: (value) {
                    print("on selected $value");
                    cubit.getPanalsData(
                        collectionName: value,
                        collection: panalCollection,
                        docUid: panalUid);
                  }),
              verticalSpace(20),
              textAboveDrowpDownButton("Panel (Wh)"),
              AppDropDownButton(
                  data: cubit.panalTypeList, onSelecte: (value) {}),
              verticalSpace(20),
              Center(
                  child: AppTextButton(
                      textStyle: TextStyles.font25BlackRegular
                          .copyWith(color: Colors.white),
                      text: 'حفظ',
                      onpressed: () {
                        cubit.allCalculation();
                        // print(cubit.inverters[0].maxInputDC);
                        // print(cubit.inverters[0].input1DC);
                        // print(cubit.inverters[0].input2DC);
                        // print(cubit.inverters[0].ratedOutputCurrent);
                        // print(cubit.inverters[0].modelInverter);
                        // print(cubit.panals[0].imp);
                        // print(cubit.panals[0].pmax);
                        // print(cubit.panals[0].sccf);
                        // print(cubit.panals[0].voc);
                        // print(cubit.panals[0].vnip);
                      }))
            ],
          ),
        );
      },
    );
  }
}
