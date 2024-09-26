import 'package:flutter/material.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/widgets/text_and_drop_down_button.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/widgets/text_and_text_field.dart';

class LightingCategoriesForm extends StatelessWidget {
  const LightingCategoriesForm(
      {super.key,
      required this.data,
      required this.formKey,
      required this.priceController,
      required this.numberController,
      required this.typeController,
      required this.capacityController,
      required this.savePdf});
  final Map<String, dynamic> data;
  final GlobalKey<FormState> formKey;
  final Function savePdf;
  final TextEditingController typeController;
  final TextEditingController capacityController;
  final TextEditingController priceController;
  final TextEditingController numberController;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextAndDropDownButton(
              name: data['first_name'],
            ),
            verticalSpace(20),
            TextAndDropDownButton(
              name: data['second_name'],
            ),
            verticalSpace(20),
            TextAndTextFeild(
              controller: priceController,
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
              controller: numberController,
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
                      savePdf();
                      context.pop();
                      print("ckiked");
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
