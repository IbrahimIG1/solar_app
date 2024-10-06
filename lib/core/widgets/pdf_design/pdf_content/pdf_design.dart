import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:solar/core/widgets/pdf_design/header/pdf_header.dart';
import 'package:solar/core/widgets/pdf_design/header/widgets/company_info.dart';
import 'package:solar/core/widgets/pdf_design/pdf_table/table_pdf.dart';
import 'package:solar/core/widgets/pdf_design/pdf_table/total_price_table.dart';

class PdfContent {
  static Future<Uint8List> generatePdf(
      {PdfPageFormat? format,
      required List<Map<String, dynamic>> pdfData,
      required double prices}) async {
    final pdf = Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* header companey info.
                pdfHeader(),
                pw.Divider(height: 20.h),
                //* divider after header.
                txtUnderDivider(
                    txt:
                        "This Table has your prices information calculation:-"),
                pw.SizedBox(height: 10.h),
                //* the table
                buildTable(data: pdfData, prices: prices),
                pw.SizedBox(height: 10.h),
                //* total price under table.
                totalPriceTable(prices: prices),
              ]);
        },
      ),
    );
    //* save pdf file in local app to get in screen.
    await savePdfInMyDirectory(pdf);
    //* save pdf file in path which user choose.
    return await pdf.save();
  }
}

//* save the PDF file in app directory to get all of pdf files after save in pdf screen.
Future<void> savePdfInMyDirectory(Document pdf) async {
  //* requist permissions
  await requirestPermissions();
  // Get the directory to save the PDF file
  final directory = await getApplicationDocumentsDirectory();
  final time = timeFormate();
  print("get Application Documents Directory :- $directory");
  final String filePath = '${directory.path}/$time.pdf';
  // open file directory
  final file = File(filePath);
  // save pdf in filePath directory >>> [writeAsBytes] mean save.
  await file.writeAsBytes(await pdf.save());
}

//* requist storage permissions to save pdf
requirestPermissions() async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
}

//* time Formate to date and houres:min:sec
String timeFormate() {
  DateTime now = DateTime.now();
  String time = DateFormat('yyyy-MM-dd - HH:mm:ss').format(now);
  return time;
}
