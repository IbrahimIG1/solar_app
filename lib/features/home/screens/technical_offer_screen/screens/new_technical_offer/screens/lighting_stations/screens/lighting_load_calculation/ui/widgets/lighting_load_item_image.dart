import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightingLoadItemImage extends StatelessWidget {
  const LightingLoadItemImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          // side: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        child: Container(
          height: .25.sh,
          // width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
            image: DecorationImage(
                image: FileImage(File(image)), fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
