import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/widgets.dart' as pw;

//* one information info >> Row has 2 text
pw.Widget companeyInfoItem({required String lable, required String txt}) {
  return pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
    pw.Text(lable,
        style: pw.TextStyle(fontSize: 12.sp, fontWeight: pw.FontWeight.bold)),
    pw.SizedBox(width: 2.w),
    pw.Text(txt,
        style: pw.TextStyle(fontSize: 12.sp, fontWeight: pw.FontWeight.bold)),
  ]);
}

//* section :- information info (address , phone , email)
pw.Widget companeyInfoSection() {
  return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
    companeyInfoItem(lable: "Phone:", txt: '01021861291'),
    companeyInfoItem(lable: "Address:", txt: '13-street'),
    companeyInfoItem(lable: "Gmail:", txt: 'companey@gmail.com'),
  ]);
}

//* section :- companey name
pw.Widget companeyName({required String lable}) {
  return pw.Text(lable,
      style: pw.TextStyle(fontSize: 15.sp, fontWeight: pw.FontWeight.bold));
}

//* section :- companey name
pw.Widget txtUnderDivider({required String txt}) {
  return pw.Text(txt,
      style: pw.TextStyle(fontSize: 15.sp, fontWeight: pw.FontWeight.bold));
}

pw.Container cellTitleText({required String txt}) {
  return pw.Container(
    // alignment: pw.Alignment.center,
    padding: pw.EdgeInsets.all(8.h),
    child: pw.Text(
      txt,
      style: pw.TextStyle(fontSize: 15.sp, fontWeight: pw.FontWeight.bold),
    ),
  );
}

pw.Container cellText({required String txt}) {
  return pw.Container(
    padding: pw.EdgeInsets.all(8.h),
    child: pw.Text(
      txt,
      style: pw.TextStyle(fontSize: 12.sp, fontWeight: pw.FontWeight.normal),
    ),
  );
}

// final image = pw.MemoryImage(
//   File('assets/images/public_icons/main_image.png').readAsBytesSync(),
// );

// pw.Widget companeyLogo() async {
//   late Image theImage;
//   final img =
//       await rootBundle.load('assets/images/public_icons/main_image.png');
//   final imageBytes = img.buffer.asUint8List();
//   pw.Image image1 =
//       pw.Image(pw.MemoryImage(imageBytes), height: 25.h, width: 25.w);
//   return  pw.Container(child: image1);
// }
