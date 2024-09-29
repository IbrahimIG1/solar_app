import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.index,
    required this.data,
    required this.onTap,
    required this.isDone,
  });
  final int index;
  final bool isDone;
  final Function onTap;
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Stack(
        children: [
          Card(
            elevation: 5,
            shadowColor: Colors.black,
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(25.w),
              // color: Colors.red,
              child: Center(
                child: Image.asset(
                  data['icon'],
                  width: data['width'],
                  //   height: data['height'],
                ),
              ),
            ),
          ),
          if (isDone)
            Positioned(
              right: 0,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  )),
            ),
        ],
      ),
    );
  }
}
