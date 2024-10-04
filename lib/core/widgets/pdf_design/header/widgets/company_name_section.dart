import 'package:pdf/widgets.dart' as pw;
import 'package:solar/core/widgets/pdf_design/header/widgets/company_info.dart';

pw.Widget companeyNameSection({required String lable}) {
  return pw.Column(children: [
    companeyName(lable: 'Company name'),
    companeyName(lable: 'Company Logo'),
  ]);
}
