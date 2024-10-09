import 'package:flutter/material.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_drop_down_button.dart';

class TextAndDropDownButton extends StatelessWidget {
  TextAndDropDownButton({
    super.key,
    required this.name,
    required this.items,
    this.isCapacity,
    required this.selectedValue,
  });
  final String name;
  String selectedValue;
  final bool? isCapacity;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    // String dropdownValue = items.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyles.font25BlackRegular,
        ),
        AppDropDownButton(
          onSelecte: (value) {
            selectedValue = value;
          },
          isCapacity: isCapacity,
          data: items,
        )
      ],
    );
  }
}
