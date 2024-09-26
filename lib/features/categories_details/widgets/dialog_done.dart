import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';

class DialogDone extends StatelessWidget {
  const DialogDone({super.key, this.color, this.icon});
  final Color? color;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 30.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(
              icon ?? Icons.check,
              size: 35,
              color: color ?? Colors.white,
            ),
          ),
          verticalSpace(10.w),
          Text(
            "Done",
            style: TextStyles.font16BlackRegular,
          ),
          verticalSpace(10.w),
          const LinearProgressIndicator(
            // valueColor: Colors.blue,
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
