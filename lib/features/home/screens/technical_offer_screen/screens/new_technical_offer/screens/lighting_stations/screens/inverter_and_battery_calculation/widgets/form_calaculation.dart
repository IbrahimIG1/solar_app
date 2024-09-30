import 'package:flutter/material.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/widgets/text_and_drop_down_button.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/widgets/text_and_text_field.dart';

class FormCalaculation extends StatelessWidget {
  const FormCalaculation({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> typeNamesList = [
      "type-1",
      "type-2",
      "type-3",
    ];
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
                  onpressed: () {}))
        ],
      ),
    );
  }
}
