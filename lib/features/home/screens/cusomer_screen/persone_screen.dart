import 'package:flutter/material.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/core/widgets/main_image.dart';
import 'package:solar/features/categories_details/widgets/text_and_text_field.dart';
import 'package:solar/features/home/screens/cusomer_screen/widgets/customer_form.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainImage(arrowBacFunc: () {
                context.pop();
              }),
             CustomerForm()
            ],
          ),
        ),
      ),
    );
  }
}
