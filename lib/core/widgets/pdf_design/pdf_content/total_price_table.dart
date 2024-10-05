import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:solar/generated/l10n.dart';

pw.Widget totalPriceTable({required double prices}) {
  return pw.Container(
      padding: pw.EdgeInsets.symmetric(horizontal: 20.w),
      child: pw.Row(children: [
        Text(
          "Total Price",
          style: pw.TextStyle(fontSize: 15.sp, fontWeight: pw.FontWeight.bold),
        ),
        Spacer(),
        Text("${prices.toString()} ${S.current.pound}",
            style:
                pw.TextStyle(fontSize: 15.sp, fontWeight: pw.FontWeight.bold)),
      ]));
}
