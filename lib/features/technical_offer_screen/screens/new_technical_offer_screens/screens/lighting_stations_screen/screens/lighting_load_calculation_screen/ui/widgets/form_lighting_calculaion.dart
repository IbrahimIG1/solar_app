import 'package:flutter/material.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/features/categories_details/widgets/text_and_text_feild.dart';

class FormLightingCalculaion extends StatelessWidget {
  const FormLightingCalculaion({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Form(
          child: Column(
        children: [
          TextAndTextFeild(
              hintText: "أدخل قدرة الماتور بالحصان", name: 'عدد الوحدات'),
          verticalSpace(20),
          TextAndTextFeild(
              hintText: "أدخل قدرة الماتور بالحصان", name: 'قدرة الوحدة'),
          verticalSpace(20),
          TextAndTextFeild(
              hintText: "أدخل قدرة الماتور بالحصان", name: 'عدد ساعات التشغيل'),
          verticalSpace(20),
          appButton(txt: 'احسب')
        ],
      )),
    );
  }
}
