import 'package:pdf/widgets.dart' as pw;
import 'package:solar/features/home/screens/price_management/widgets/pdf_design/company_info.dart';

pw.Widget companeyNameSection({required String lable}) {
  return pw.Column(children: [
    companeyName(lable: 'Company name'),
    companeyName(lable: 'Company Logo'),
  ]);
}
