import 'package:flutter/material.dart';
import 'package:solar/core/theming/colors_manager.dart';
import 'package:solar/core/theming/font_styles.dart';

class AppTextFormFeild extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enableBorder;
  final InputBorder? foucedBorder;
  final String hintText;
  final TextStyle? hintTextStyle;
  // final TextStyle? lableStyle;
  final Widget? suffixIcon;
  final bool? isObscure;
  final Color? backGroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? keyboardType;

  const AppTextFormFeild({
    super.key,
    this.contentPadding,
    this.enableBorder,
    this.foucedBorder,
    required this.hintText,
    this.hintTextStyle,
    this.suffixIcon,
    this.isObscure,
    this.backGroundColor,
    this.controller,
    required this.validator, this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          // label: Text(lable ?? "",
          //     style: lableStyle ?? TextStyles.font16GreyMeduim),
          
          hintTextDirection: TextDirection.ltr,
          isDense: true,
          hintText: hintText,
          hintStyle: hintTextStyle ?? TextStyles.font16GreyMeduim,
          focusedBorder: foucedBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.3,
                  color: ColorsManager.mainColor,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
          enabledBorder: enableBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.3,
                  color: ColorsManager.grey,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.3),
            borderRadius: BorderRadius.circular(25.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.3),
            borderRadius: BorderRadius.circular(25.0),
          ),
          suffixIcon: suffixIcon,
          fillColor: backGroundColor ?? Colors.white,
          filled: true),
      obscureText: isObscure ?? false,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
