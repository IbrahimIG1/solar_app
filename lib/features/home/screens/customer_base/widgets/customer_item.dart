import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/features/home/screens/customer_base/widgets/date_section.dart';
import 'package:solar/features/home/screens/customer_base/widgets/personal_info.dart';

class CustomerItem extends StatelessWidget {
  const CustomerItem({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.0.h, bottom: 15.h),
              child: PersonalInfo(
                name: data['name'],
                address: data['address'],
                stationType: data['station_type'],
                phone: data['phone'],
              ),
            ),
            DateSection(txt: data['offer_expiry_date']),
          ],
        ),
      ),
    );
  }
}
