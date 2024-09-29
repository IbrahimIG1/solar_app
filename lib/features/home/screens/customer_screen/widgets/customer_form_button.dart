import 'package:flutter/material.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/generated/l10n.dart';

class CustomerFormButton extends StatelessWidget {
  const CustomerFormButton(
      {super.key,

      required this.formKey,
      required this.addCustomer});
  // final String customerName;
  // final String customerAddress;
  // final String customerPhone;
  // final String customerStation;
  // final String customerOfferExpire;
  final Function addCustomer;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return AppTextButton(
        textStyle: TextStyles.font25BlackRegular.copyWith(color: Colors.white),
        text: S.current.save,
        onpressed: () {
          if (formKey.currentState!.validate()) {
            addCustomer();
            return;
          }
        });
  }
}
