import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/di/di.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/core/widgets/text_and_drop_down_button.dart';
import 'package:solar/core/widgets/text_and_text_field.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/cubit/technical_offers_cubit.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/cubit/technical_offers_state.dart';

class FormCalaculation extends StatelessWidget {
  const FormCalaculation({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> typeNamesList = [
      "type-1",
      "type-2",
      "type-3",
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextAndTextFeild(
                  validator: (value) {},
                  hintText: "أدخل قدرة الماتور بالحصان",
                  name: "Load(Wh)",
                ),
                verticalSpace(20),
                TextAndDropDownButton(
                  selectedValue: "",
                  items: typeNamesList,
                  name: 'Inverter Type',
                ),
                verticalSpace(20),
                TextAndDropDownButton(
                  selectedValue: "",
                  items: typeNamesList,
                  name: 'Panel Type',
                ),
                verticalSpace(20),
                TextAndDropDownButton(
                  items: typeNamesList,
                  selectedValue: "",
                  name: 'Panel (Wh)',
                ),
                verticalSpace(20),
                Center(
                    child: AppTextButton(
                        textStyle: TextStyles.font25BlackRegular
                            .copyWith(color: Colors.white),
                        text: 'حفظ',
                        onpressed: () {
                          print(cubit.calculation(capacity: 10, wh: 10));
                        }))
              ],
            ),
          );
        },
      ),
    );
  }
}
