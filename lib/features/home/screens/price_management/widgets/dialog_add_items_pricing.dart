import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/widgets/app_drop_down_button.dart';
import 'package:solar/core/widgets/app_text_feild.dart';

class AddItemPricingDialog extends StatefulWidget {
  const AddItemPricingDialog({
    super.key,
    required this.saveData,
    required this.data,
    required this.typeController,
    required this.capacityController,
    required this.priceController,
    required this.categoryNameAdminController,
  });
  final TextEditingController typeController;
  final TextEditingController capacityController;
  final TextEditingController priceController;
  final TextEditingController categoryNameAdminController;
  final Function() saveData;
  final List<String> data;

  @override
  State<AddItemPricingDialog> createState() => _AddItemPricingDialogState();
}

class _AddItemPricingDialogState extends State<AddItemPricingDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 35,
        child:
            Image.asset("assets/images/categories_icons/power_generator.png"),
      ),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppDropDownButton(
                // valueSelected: () {
                  
                // },
                data: widget.data,
                onSelecte: (value) {
                  widget.categoryNameAdminController.text = value;
                }),
            verticalSpace(10.h),
            AppTextFormFeild(
                controller: widget.typeController,
                hintText: "Enter Type",
                validator: (value) {}),
            verticalSpace(10.h),
            AppTextFormFeild(
                controller: widget.capacityController,
                hintText: "Enter capacity",
                validator: (value) {}),
            verticalSpace(10.h),
            AppTextFormFeild(
                controller: widget.priceController,
                hintText: "Enter price",
                validator: (value) {}),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('save Data'),
          onPressed: () {
            widget.saveData();
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
