import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/features/home/screens/customer_base/widgets/date_circle.dart';
import 'package:solar/features/home/screens/customer_base/widgets/personal_info.dart';

class CustomerItem extends StatelessWidget {
  const CustomerItem({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            // Container(
            //   child: Text(data['offer_expiry_date']),
            // ),
            DateCircle(
              txt: data['offer_expiry_date'],
            ),
            horizontalSpace(15),
            PersonalInfo(
              name: data['name'],
              address: data['address'],
              stationType: data['station_type'],
              phone: data['phone'],
            ),
          ],
        ),
      ),
    );
  }
}
