import 'package:pdf/widgets.dart' as pw;
import 'package:solar/core/widgets/pdf_design/header/widgets/company_info.dart';

pw.Row pdfFooter() =>
    pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
      pw.Column(children: [
        companeyName(lable: 'Company name'),
        companeyName(lable: 'Company logo'),
      ]),
      companeyInfoSection(),
    ]);
