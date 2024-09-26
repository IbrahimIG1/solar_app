import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:solar/core/theming/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/theming/font_styles.dart';

class AppTextButton extends StatelessWidget {
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? borderRaduis;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? horizontalPadding;
  final double? verticalPadding;
  final String text;
  final VoidCallback onpressed;

  const AppTextButton(
      {super.key,
      this.backgroundColor,
      this.textStyle,
      this.buttonHeight,
      this.buttonWidth,
      required this.text,
      required this.onpressed,
      this.horizontalPadding,
      this.verticalPadding,
      this.borderRaduis});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          elevation: WidgetStateProperty.all(5),
          shadowColor: WidgetStateProperty.all(Colors.black),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(borderRaduis ?? 22.0))),
          backgroundColor: WidgetStateProperty.all(
              backgroundColor ?? ColorsManager.lightGray),
          // textStyle: MaterialStateProperty.all(textStyle),
          // fixedSize: WidgetStateProperty.all(
          //   Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 50.h),
          // ),
          padding: WidgetStateProperty.all(EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 25.w,
              vertical: verticalPadding?.h ?? 0.h))),
      onPressed: onpressed,
      child: OutlinedText(
          text: Text(
            text,
            style: textStyle ??
                TextStyles.font16GreyMeduim.copyWith(color: Colors.white),
          ),
          strokes: [
            OutlinedTextStroke(color: Colors.black, width: 2),
          ]),
    );
  }
}
