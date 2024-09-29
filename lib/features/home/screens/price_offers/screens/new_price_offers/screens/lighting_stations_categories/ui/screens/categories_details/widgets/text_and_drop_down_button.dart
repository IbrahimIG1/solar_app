import 'package:flutter/material.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_drop_down_button.dart';

class TextAndDropDownButton extends StatefulWidget {
  const TextAndDropDownButton(
      {super.key, required this.name, required this.items});
  final String name;
  final List<String> items;
  @override
  State<TextAndDropDownButton> createState() => _TextAndDropDownButtonState();
}

class _TextAndDropDownButtonState extends State<TextAndDropDownButton> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    // String dropdownValue = items.first;
    // String? dropdownValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: TextStyles.font25BlackRegular,
        ),
        AppDropDownButton(
            data: widget.items,
            onSelecte: (selectedValue) {
              // dropdownValue = selectedValue;
            })
      ],
    );
  }
}
