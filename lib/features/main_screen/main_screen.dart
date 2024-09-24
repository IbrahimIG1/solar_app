import 'package:flutter/material.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/widgets/widgets/main_image.dart';
import 'package:solar/features/home/ui/home_screen.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // testSentryError();
   
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          MainImage(
            arrowBacFunc: () {},
          ),
          verticalSpace(30),
          HomeScreen()
        ],
      )),
    );
  }

  // Future<void> testSentryError() async {
  //   try {
  //     int? num;
  //     int result = num! + 1;
  //   } catch (exception, stackTrace) {
  //     print('exception');
  //     await Sentry.captureException(
  //       exception,
  //       stackTrace: stackTrace,
  //     );
  //   }
  // }
}
