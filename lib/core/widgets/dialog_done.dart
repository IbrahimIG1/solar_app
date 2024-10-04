import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_linear_progress_indicator.dart';

class DialogDone extends StatelessWidget {
  const DialogDone({super.key, this.color, this.icon, required this.status});
  final Color? color;
  final String status;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 30.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: color ?? Colors.green,
            child: Icon(
              icon ?? Icons.check,
              size: 35.r,
              color: Colors.white,
            ),
          ),
          verticalSpace(10.w),
          Text(
            status,
            style: TextStyles.font16BlackRegular,
          ),
          verticalSpace(10.w),
          if(color != Colors.red)
          AppLinearProgressIndicator()
        ],
      ),
    );
  }
}
