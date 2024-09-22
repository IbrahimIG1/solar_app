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
      child: InkWell(
        onTap: () {
          context.pushNamed(routeName);
        },
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                border: Border.all(color: Colors.black, width: 1)),
            width: 340.w,
            height: 152.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  data[index]['icon'],
                  width: 60.w,
                  height: 60.h,
                ),
                Text(
                  data[index]['e_name'],
                  style: TextStyles.font25BlackRegular,
                ),
                OutlinedText(
                    text: Text(
                      data[index]['ar_name'],
                      style: TextStyles.font20BlackRegular,
                    ),
                    strokes: [
                      OutlinedTextStroke(color: Colors.black, width: 2),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
