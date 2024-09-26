import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/theming/font_styles.dart';

class DateCircle extends StatelessWidget {
  const DateCircle({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 45.r,
      backgroundColor: Colors.blue,
      child: Text(
        txt,
        style: TextStyles.font16GreyMeduim.copyWith(color: Colors.white),
      ),
    );
  }
}
