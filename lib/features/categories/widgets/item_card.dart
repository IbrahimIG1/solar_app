import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.index, required this.data, required this.onTap});
  final int index;
  final Function onTap;
  final List<Map<String, dynamic>> data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 160.w,
        height: 150.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border.all(width: 1, color: Colors.black)),
        child: Center(
          child: Image.asset(
            data[index]['icon'],
            width: data[index]['width'],
            height: data[index]['height'],
          ),
        ),
      ),
    );
  }
}
