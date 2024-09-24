import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightingCalcolatorItem extends StatelessWidget {
  const LightingCalcolatorItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.all(10.h),
        // width: 150.w,
        // height: 160.h,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain, image: FileImage(File(image)))),
      ),
    );
  }
}
