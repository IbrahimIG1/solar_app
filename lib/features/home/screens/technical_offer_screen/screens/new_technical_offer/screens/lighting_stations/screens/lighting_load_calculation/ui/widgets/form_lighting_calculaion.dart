import 'package:flutter/material.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/widgets/text_and_text_field.dart';

class FormLightingCalculaion extends StatelessWidget {
  const FormLightingCalculaion({super.key, required this.name, this.formKey});
  final String name;
  final Key? formKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              TextAndTextFeild(
                  validator: (value) {},
                  textDirection: TextDirection.rtl,
                  hintText: "أدخل قدرة الماتور بالحصان",
                  name: 'عدد الوحدات'),
              verticalSpace(20),
              TextAndTextFeild(
                  validator: (value) {},
                  textDirection: TextDirection.rtl,
                  hintText: "أدخل قدرة الماتور بالحصان",
                  name: 'قدرة الوحدة'),
              verticalSpace(20),
              TextAndTextFeild(
                  validator: (value) {},
                  textDirection: TextDirection.rtl,
                  hintText: "أدخل قدرة الماتور بالحصان",
                  name: 'عدد ساعات التشغيل'),
              verticalSpace(20),
              AppTextButton(
                  textStyle: TextStyles.font25BlackRegular
                      .copyWith(color: Colors.white),
                  text: 'احسب',
                  onpressed: () {})
            ],
          )),
    );
  }
}
