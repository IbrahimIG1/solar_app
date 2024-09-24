import 'package:flutter/material.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/features/categories_details/widgets/text_and_drop_down_button.dart';
import 'package:solar/features/categories_details/widgets/text_and_text_feild.dart';


class CategoriesDetailsScreen extends StatelessWidget {
  const CategoriesDetailsScreen({
    super.key,
    required this.list,
  });
  final Map<dynamic, dynamic> list;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainImage(arrowBacFunc: () {
              context.pop();
            }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextAndDropDownButton(
                    name: list['first_name'],
                  ),
                  verticalSpace(20),
                  TextAndDropDownButton(
                    name: list['second_name'],
                  ),
                  verticalSpace(20),
                  TextAndTextFeild(
                    hintText: "أدخل عدد الالواح",
                    name: list['thired_name'],
                  ),
                  verticalSpace(20),
                  TextAndTextFeild(
                    hintText: 'أدخل السعر',
                    name: list['forth_name'],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
