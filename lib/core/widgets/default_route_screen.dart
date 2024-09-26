import 'package:flutter/material.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/widgets/app_button.dart';

import '../theming/font_styles.dart';

class DefaultRouteScreen extends StatelessWidget {
  const DefaultRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Screen Will Created Soon!😉',
            style: TextStyles.font25BlackRegular,
          ),
          AppTextButton(
              textStyle:
                  TextStyles.font16GreyMeduim.copyWith(color: Colors.white),
              text: "Go Back",
              onpressed: () {
                context.pop();
              })
        ],
      ),
    );
  }
}
