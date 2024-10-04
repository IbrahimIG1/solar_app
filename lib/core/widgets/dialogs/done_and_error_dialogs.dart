import 'package:flutter/material.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/widgets/dialog_done.dart';

loadingDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return const Center(
            child: DialogDone(
          status: "Loading",
          color: Colors.amberAccent,
          icon: Icons.rocket_launch_outlined,
        ));
      },
    );
    doneDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return const Center(
            child: DialogDone(
          status: "Done",
          color: Colors.green,
          icon: Icons.check,
        ));
      },
    ).timeout(
      const Duration(milliseconds: 700),
      onTimeout: () => context.pop(),
    );
errorDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return const Center(
            child: DialogDone(
          status: "Error",
          color: Colors.red,
          icon: Icons.close,
        ));
      },
    );
