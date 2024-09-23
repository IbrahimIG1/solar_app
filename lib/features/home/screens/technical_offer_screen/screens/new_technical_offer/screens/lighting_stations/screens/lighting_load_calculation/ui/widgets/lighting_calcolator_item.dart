import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightingCalcolatorItem extends StatelessWidget {
  const LightingCalcolatorItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: 150.w,
        height: 160.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white),
        child: Image.asset(
          image,
          width: 110.w,
          height: 90.h,
        ),
      ),
    );
  }
}
