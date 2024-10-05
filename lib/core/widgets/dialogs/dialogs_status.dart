import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/core/widgets/dialogs/app_dialog.dart';

doneDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return const Center(
            child: AppDialog(
          status: "Done",
          color: Colors.green,
          icon: Icons.check,
        ));
      },
    ).timeout(
      const Duration(milliseconds: 800),
      onTimeout: () => context.pop(),
    );

errorDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return const Center(
            child: AppDialog(
          status: "Error",
          color: Colors.red,
          icon: Icons.close,
        ));
      },
    );

deleteDialog(BuildContext context, Function deleteFunc) => showDialog(context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 30.h),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.delete,
                  size: 35.w,
                  color: Colors.red,
                ),
                verticalSpace(10.w),
                AppTextButton(
                    backgroundColor: Colors.red,
                    textStyle: TextStyles.font20WhiteRegular,
                    text: 'Delete',
                    onpressed: () {
                      deleteFunc();
                      // context.pop();
                    }),
              ],
            ),
          ),
        );
      },
    );
