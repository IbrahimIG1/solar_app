import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';

class AddLightingItemDialog extends StatelessWidget {
  const AddLightingItemDialog({
    super.key,
    required this.nameController,
    required this.addImage,
    required this.saveData,
  });
  final TextEditingController nameController;
  final Function addImage;
  final Function saveData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
                isDense: false,
                border: OutlineInputBorder(),
                hintText: "Enter Item Name"),
          ),
          verticalSpace(10.h),
          ElevatedButton(
            child: const Text("Add Image"),
            onPressed: () {
              print("Add Image press");
              addImage();
            },
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('save Data'),
          onPressed: () {
            print("Add Image press");
            saveData();
            context.pop();
          },
        ),
        ElevatedButton(
          child: const Text('Cancle'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
