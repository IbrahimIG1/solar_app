import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/theming/font_styles.dart';

class DateSection extends StatelessWidget {
  const DateSection({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        width: .5.sw,
        height: 25.h,
        child: Center(
          child: Text(
            txt,
            style: TextStyles.font16GreyMeduim.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
