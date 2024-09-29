import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/theming/colors_manager.dart';
import 'package:solar/core/theming/font_styles.dart';

class CustomerTextField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enableBorder;
  final InputBorder? foucedBorder;
  final String hintText;
  final String? lable;
  final TextStyle? hintTextStyle;
  final TextStyle? lableStyle;
  final Widget? suffixIcon;
  final bool? isObscure;
  final bool? autoFocus;

  final bool? readOnly;
  final Color? backGroundColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String?) validator;

  const CustomerTextField({
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
    this.lable,
    this.lableStyle,
    required this.validator,
    this.keyboardType,
    this.readOnly,
    this.autoFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.w),
      child: TextFormField(
        autofocus: autoFocus ?? false,
        readOnly: readOnly ?? false,
        keyboardType: keyboardType ?? TextInputType.name,
        scrollPadding: EdgeInsets.only(bottom: 50.h),
        textDirection: TextDirection.rtl,
        controller: controller,
        decoration: InputDecoration(
            label: Text(lable ?? "",
                style: lableStyle ?? TextStyles.font16GreyMeduim),
            hintTextDirection: TextDirection.rtl,
            isDense: true,
            hintText: hintText,
            hintStyle: hintTextStyle ?? TextStyles.font16GreyMeduim,
            focusedBorder: foucedBorder ??
                OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1.3,
                    color: ColorsManager.mainBlue,
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
      ),
    );
  }
}
