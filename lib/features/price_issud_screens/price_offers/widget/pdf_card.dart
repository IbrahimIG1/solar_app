import 'package:flutter/material.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';

class PdfCard extends StatelessWidget {
  const PdfCard({super.key, required this.pdfName});
  final String pdfName;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            const Icon(
              Icons.file_present_outlined,
              color: Colors.redAccent,
            ),
            horizontalSpace(5),
            Text(
              pdfName,
              style: TextStyles.font16BlackRegular,
            ),
          ],
        ),
      ),
    );
  }
}
