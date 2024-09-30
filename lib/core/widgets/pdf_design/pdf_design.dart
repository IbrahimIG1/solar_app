import 'dart:typed_data';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:solar/core/widgets/pdf_design/header/pdf_header.dart';
import 'package:solar/core/widgets/pdf_design/header/widgets/company_info.dart';
import 'package:solar/core/widgets/pdf_design/pdf_content/table_pdf.dart';

class PdfDesign {
  static Future<Uint8List> generatePdf(
      {PdfPageFormat? format,
      required List<Map<String, dynamic>> pdfData}) async {
    final pdf = Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pdfHeader(),
                pw.Divider(height: 20.h),
                txtUnderDivider(
                    txt:
                        "This Table has your prices information calculation:-"),
                pw.SizedBox(height: 10.h),
                buildTable(data: pdfData),
              ]);
        },
      ),
    );
    return await pdf.save();
  }
}
