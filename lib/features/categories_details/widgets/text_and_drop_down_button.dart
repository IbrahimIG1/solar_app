import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/theming/font_styles.dart';

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
        Container(
          color: Colors.white,
          width: double.infinity,
          child: DropdownMenu<String>(
            expandedInsets: EdgeInsets.zero, // to get parnt width
            initialSelection: items.first,
            onSelected: (newValue) {
              print('choosed is $newValue');
              print('dropdownValue is $dropdownValue');
              setState(() {
                dropdownValue = newValue;
                print('dropdownValue is $dropdownValue');
              });
            },
            dropdownMenuEntries:
                items.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
