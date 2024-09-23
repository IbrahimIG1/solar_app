import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/colors_manager.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/features/categories_details/widgets/text_and_drop_down_button.dart';
import 'package:solar/features/categories_details/widgets/text_and_text_feild.dart';

class FormCalaculation extends StatelessWidget {
  const FormCalaculation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextAndTextFeild(
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
              child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(ColorsManager.lightGray)),
            onPressed: () {},
            child: OutlinedText(
                text: Text(
                  'احسب',
                  style: TextStyles.font25BlackRegular
                      .copyWith(color: Colors.white),
                ),
                strokes: [
                  OutlinedTextStroke(color: Colors.black, width: 2),
                ]),
          ))
        ],
      ),
    );
  }
}
