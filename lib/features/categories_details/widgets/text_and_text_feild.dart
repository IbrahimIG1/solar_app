import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';

class TextAndTextFeild extends StatelessWidget {
  const TextAndTextFeild(
      {super.key, required this.hintText, required this.name});
  final String hintText;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyles.font25BlackRegular,
        ),
        verticalSpace(10),
        TextFormField(
          // cursorHeight: ,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              isDense: true, // this will remove the default content padding
              hintTextDirection: TextDirection.rtl,
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: hintText,
              hintStyle: TextStyles.font25GreyRegular),
        ),
      ],
    );
  }
}
