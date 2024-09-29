import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/theming/font_styles.dart';

class AppDropDownButton extends StatelessWidget {
  const AppDropDownButton(
      {super.key,
      required this.data,
      required this.onSelecte,
      this.lable,
      this.lableStyle});
  final List<String> data;

  final String? lable;
  final TextStyle? lableStyle;
  final Function(String value) onSelecte;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      child: DropdownMenu<String>(
        textStyle: TextStyles.font16GreyMeduim,
        // inputDecorationTheme: InputDecorationTheme(border: InputBorder.none,
        // ),
        label: Text(
          lable ?? "",
          style: lableStyle,
        ),
        trailingIcon: Container(
          child: Icon(
            Icons.arrow_drop_down,
            size: 30.w,
          ),
        ),
        expandedInsets: EdgeInsets.zero, // to get parnt width
        initialSelection: data.first,
        onSelected: (newValue) {
          onSelecte(newValue!);
          // print('choosed is $newValue');
          // print('dropdownValue is $dropdownValue');
          // setState(() {
          //   dropdownValue = newValue;
          // });
        },
        dropdownMenuEntries:
            data.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(
            value: value,
            label: value,
            // style: ButtonStyle(alignment: Alignment.center)
          );
        }).toList(),
      ),
    );
  }
}
