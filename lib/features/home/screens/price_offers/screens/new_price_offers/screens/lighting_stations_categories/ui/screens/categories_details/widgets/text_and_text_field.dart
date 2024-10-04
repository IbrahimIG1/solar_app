import 'package:flutter/material.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_text_feild.dart';

class TextAndTextFeild extends StatelessWidget {
  const TextAndTextFeild({
    super.key,
    required this.hintText,
    required this.name,
    this.textDirection,
    this.controller,
    required this.validator, this.keboardType,
  });
  final String hintText;
  final String name;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final Function(String?) validator;
  final TextInputType? keboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: textDirection ?? TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyles.font20BlackRegular,
        ),
        // verticalSpace(10),
        AppTextFormFeild(
          keyboardType:keboardType ?? TextInputType.name,
          hintText: hintText,
          validator: (value) {
            return validator(value);
          },
          controller: controller,
        )
      ],
    );
  }
}
