import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/theming/font_styles.dart';

class MainItem extends StatelessWidget {
  const MainItem(
      {super.key,
      required this.data,
      required this.index,
      required this.routeName});
  final List<Map<String, dynamic>> data;
  final int index;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(routeName);
          //  context.pushNamedAndRemoveUntil(
          //   routeName,
          //   predicate: (route) => false,
          // );
        },
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          color: Colors.white,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5).w,
                  // width: data[index]['width'],
                  // height: data[index]['height'],
                  child: Image.asset(
                    data[index]['icon'],
                    fit: BoxFit.contain,
                    width: data[index]['width'],
                    height: data[index]['height'],
                  ),
                ),

                Text(
                  data[index]['name'],
                  style: TextStyles.font16BlackBold,
                ),
                // OutlinedText(
                //     text: Text(
                //       data[index]['name'],
                //       style: TextStyles.font20WhiteRegular,
                //     ),
                //     strokes: [
                //       OutlinedTextStroke(color: Colors.black, width: 2.w),
                //     ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
