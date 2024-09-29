import 'dart:typed_data';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:solar/features/home/screens/price_management/widgets/pdf_design/company_info.dart';

class TablePdf {
  static Future<Uint8List> generatePdf(
      PdfPageFormat format, List<Map<String, dynamic>> pdfData) async {
    final pdf = Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pw.Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(children: [
                        companeyName(lable: 'Company name'),
                        companeyName(lable: 'Company logo'),
                      ]),
                      companeyInfoSection()
                    ]),
                pw.SizedBox(height: 20),
                buildTable(pdfData),
              ]);
        },
      ),
    );
    return await pdf.save();
  }

  static pw.Widget buildTable(List<Map<String, dynamic>> data) {
    return
        // Create the table with 7 rows
        pw.Table(border: pw.TableBorder.all(), children: [
      // Table Header

      pw.TableRow(
        children: [
          pw.Text('Sun',
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, fontSize: 18.sp)),
          pw.Text('Battry',
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, fontSize: 18.sp)),
          pw.Text('Address',
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, fontSize: 18.sp)),
          pw.Text('Station Type',
              style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold, fontSize: 18.sp)),
        ],
      ),
      // 7 Rows of User Information
      for (int i = 0; i <= 7; i++) // Repeat this block to create 7 rows
        pw.TableRow(
          
          children: [
            pw.Text('Test data ',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal, fontSize: 20)),
            pw.Text('Test data ',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal, fontSize: 20)),
            pw.Text('Test data ',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal, fontSize: 20)),
            pw.Text('Test data ',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.normal, fontSize: 20)),
          ],
        ),
    ]);
  }

  static void printOrSave({List<Map<String, dynamic>>? pdfData}) {
    Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => generatePdf(format, pdfData!),
    );
  }
}
