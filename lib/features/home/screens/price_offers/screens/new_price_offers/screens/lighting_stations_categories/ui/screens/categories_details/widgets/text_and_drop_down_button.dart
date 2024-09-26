import 'package:flutter/material.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_drop_down_button.dart';

class TextAndDropDownButton extends StatefulWidget {
  const TextAndDropDownButton({super.key, required this.name});
  final String name;
  @override
  State<TextAndDropDownButton> createState() => _TextAndDropDownButtonState();
}

class _TextAndDropDownButtonState extends State<TextAndDropDownButton> {
  String? selectedValue;
  List<String> items = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];


  @override
  Widget build(BuildContext context) {
    // String dropdownValue = items.first;
    String? dropdownValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: TextStyles.font25BlackRegular,
        ),
        AppDropDownButton(
            data: items,
            onSelecte: (selectedValue) {
              dropdownValue = selectedValue;
            })
      ],
    );
  }
}
