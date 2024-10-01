import 'package:flutter/material.dart';
import 'package:solar/core/helper/current_language.dart';
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
    return Container(
      padding: EdgeInsets.only(
          right: isArabic() ? 15 : 0, left: isArabic() ? 0 : 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* person name
          personeInfoItem(name, Icons.person),
          verticalSpace(5),
          //* person address
          personeInfoItem(address, Icons.location_on_outlined),
          verticalSpace(5),
          //* person stationType
          personeInfoItem(stationType, Icons.bubble_chart_outlined),
          verticalSpace(5),
          //* person phone
          personeInfoItem(phone, Icons.phone),
        ],
      ),
    );
  }

  //* persone information icon & text
  Row personeInfoItem(String text, IconData icon) => Row(
        children: [
          Icon(icon),
          Text(": $text", style: TextStyles.font12BlackMedium),
        ],
      );
}
