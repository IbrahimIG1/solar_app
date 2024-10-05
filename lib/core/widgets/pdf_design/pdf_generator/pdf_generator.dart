import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';
import 'package:solar/core/widgets/pdf_design/pdf_design.dart';

// Future<Uint8List> generatePdf({
//   PdfPageFormat? format,
//   required List<Map<String, dynamic>> pdfData,
// }) async {
//   final pdf = Document();
//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) {
//         return pw.Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               pdfHeader(),
//               pw.Divider(height: 20.h),
//               txtUnderDivider(
//                   txt: "This Table has your prices information calculation:-"),
//               pw.SizedBox(height: 10.h),
//               buildTable(data: pdfData),
//             ]);
//       },
//     ),
//   );
//   await savePdfInMyDirectory(pdf);
//   return await pdf.save();
// }

//* layout Pdf to user save or print the pdf file
Future<void> printOrSave({required List<Map<String, dynamic>> pdfData}) async {
  Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async =>
        await PdfDesign.generatePdf(format: format, pdfData: pdfData),
  );
}

