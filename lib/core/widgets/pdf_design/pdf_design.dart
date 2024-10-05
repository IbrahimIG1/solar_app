import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:solar/core/widgets/pdf_design/footer/pdf_footer.dart';
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
                pw.Divider(height: 25.h),
                pdfFooter(),
              ]);
        },
      ),
    );
    await savePdfInMyDirectory(pdf);
    return await pdf.save();
  }
}

//* save the PDF file in app directory to get all of pdf files after save in pdf screen
Future<void> savePdfInMyDirectory(Document pdf) async {
  // Get the directory to save the PDF file
  final directory = await getApplicationDocumentsDirectory();
  final time = timeFormate();
  print("get Application Documents Directory :- $directory");
  final String filePath = '${directory.path}/$time.pdf';
  // open file directory
  final file = File(filePath);
  // write(save) pdf in filePath directory

  await file.writeAsBytes(await pdf.save());
}

//* time Formate to date and houres:min:sec
String timeFormate() {
  DateTime now = DateTime.now();
  String time = DateFormat('yyyy-MM-dd - HH:mm:ss').format(now);
  return time;
}
