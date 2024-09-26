import 'package:flutter/material.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo(
      {super.key,
      required this.name,
      required this.address,
      required this.stationType,
      required this.phone});
  final String name;
  final String address;
  final String stationType;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyles.font16BlackBold),
            verticalSpace(5),
            Text(address, style: TextStyles.font16BlackBold),
            verticalSpace(5),
            Text(stationType, style: TextStyles.font16BlackBold),
            verticalSpace(5),
            Text(phone, style: TextStyles.font16BlackBold),
          ],
        ),
      ),
    );
  }
}
