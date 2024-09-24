import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:solar/core/theming/colors_manager.dart';
import 'package:solar/core/theming/font_styles.dart';

ElevatedButton appButton({required String txt, Function? onPresed}) =>
    ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ColorsManager.lightGray)),
      onPressed: () {
        onPresed!();
      },
      child: OutlinedText(
          text: Text(
            txt,
            style: TextStyles.font25BlackRegular.copyWith(color: Colors.white),
          ),
          strokes: [
            OutlinedTextStroke(color: Colors.black, width: 2),
          ]),
    );
