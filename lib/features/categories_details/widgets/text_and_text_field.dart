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
    required this.validator,
  });
  final String hintText;
  final String name;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: textDirection ?? TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyles.font25BlackRegular,
        ),
        // verticalSpace(10),
        AppTextFormFeild(
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
