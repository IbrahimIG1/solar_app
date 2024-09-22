import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainImage extends StatelessWidget {
  const MainImage({super.key, required this.arrowBacFunc});
  final Function arrowBacFunc;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 208.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
            image: const DecorationImage(
                image: AssetImage('assets/images/public_icons/main_image.png'),
                fit: BoxFit.cover)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            arrowBacFunc();
          },
          child: Container(
            width: 50.w,
            height: 40.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/public_icons/arrow_back_image.png')),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
      )
    ]);
  }
}
