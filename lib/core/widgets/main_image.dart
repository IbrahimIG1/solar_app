import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainImage extends StatelessWidget {
  const MainImage({super.key, required this.arrowBacFunc});
  final Function arrowBacFunc;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        elevation: 5,
        shadowColor: Colors.black,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          // side: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
        child: Container(
          height: .15.sh,
          // width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
            image: DecorationImage(
                image: const AssetImage('assets/images/public_icons/logo.jpg'),
                fit: BoxFit.contain),
          ),
        ),
      ),
      Positioned(
        left: 0,
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: GestureDetector(
            onTap: () {
              arrowBacFunc();
            },
            child: Container(
              width: 50.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/public_icons/arrow_back_image.png')),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        ),
      ),
      Positioned(
        right: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 50.w,
              height: 40.h,
              child: Icon(
                Icons.menu,
                size: 35.w,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
