import 'package:flutter/material.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/features/categories_details/widgets/text_and_drop_down_button.dart';
import 'package:solar/features/categories_details/widgets/text_and_text_field.dart';

class FormCalaculation extends StatelessWidget {
  const FormCalaculation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           TextAndTextFeild(
            validator: (value){},
            hintText: "أدخل قدرة الماتور بالحصان",
            name: "Load(Wh)",
          ),
          verticalSpace(20),
          const TextAndDropDownButton(
            name: 'Inverter Type',
          ),
          verticalSpace(20),
          const TextAndDropDownButton(
            name: 'Panel Type',
          ),
          verticalSpace(20),
          const TextAndDropDownButton(
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
