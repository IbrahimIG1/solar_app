import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/di/di.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/core/widgets/app_drop_down_button.dart';
import 'package:solar/core/widgets/app_text_feild.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/cubit/technical_offers_cubit.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/cubit/technical_offers_state.dart';

class FormCalaculation extends StatelessWidget {
  const FormCalaculation({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> inverterType = [
      "VEICHI",
      "HUAWAI",
      "INVT",
    ];
    List<String> panalType = [
      "JINCO",
      "TRINA",
      "LOGI",
      "JA",
    ];
    List<String> panalCapacity = [
      "JINCO",
      "TRINA",
      "LOGI",
      "JA",
    ];
    return RepositoryProvider(
      create: (context) => TechnicalOffersCubit(getIt()),
      child: BlocConsumer<TechnicalOffersCubit, TechnicalOffersState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = TechnicalOffersCubit.get(context);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextFormFeild(
                    keyboardType: TextInputType.number,
                    hintText: "Load(PH) أدخل قدرة الماتور بالحصان",
                    controller: cubit.loadWHController,
                    validator: (value) {}),
                verticalSpace(20),
                Text(
                  "Inverter Type",
                  style: TextStyles.font25BlackRegular,
                ),
                AppDropDownButton(data: inverterType, onSelecte: (value) {}),
                verticalSpace(20),
                Text(
                  "Panel Type",
                  style: TextStyles.font25BlackRegular,
                ),
                AppDropDownButton(data: panalCapacity, onSelecte: (value) {}),
                verticalSpace(20),
                Text(
                  "Panel (Wh)",
                  style: TextStyles.font25BlackRegular,
                ),
                AppDropDownButton(data: panalType, onSelecte: (value) {}),
                verticalSpace(20),
                Center(
                    child: AppTextButton(
                        textStyle: TextStyles.font25BlackRegular
                            .copyWith(color: Colors.white),
                        text: 'حفظ',
                        onpressed: () {
                          // print(
                          //   cubit.calculation(
                          //     capacity: 10,
                          //     ph: double.parse(cubit.loadWHController.text),
                          //   ),
                          // );
                        }))
              ],
            ),
          );
        },
      ),
    );
  }
}
