import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:solar/core/widgets/pdf_design/header/widgets/company_info.dart';

pw.Widget buildTable(
    {required List<Map<String, dynamic>> data, required double prices}) {
  return
      //* Create the table
      pw.Table(border: pw.TableBorder.all(style: BorderStyle.solid), children: [
    //* Table Header
    pw.TableRow(
      verticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        cellTitleText(txt: "Type"),
        cellTitleText(txt: "Capacity"),
        cellTitleText(txt: "Price"),
      ],
    ),
    //* Rows of User Information
    for (int i = 0; i < data.length; i++)
      pw.TableRow(
        children: [
          cellText(txt: data[i]['name']),
          cellText(txt: data[i]['capacity']),
          cellText(txt: data[i]['price']),
        ],
      ),
    pw.TableRow(
      children: [
        cellText(txt: "-"),
        cellText(txt: "-"),
        cellText(txt: prices.toString()),
      ],
    ),
    // pw.TableRow(
    //   children: [
    //     cellText(txt: "-"),
    //     cellText(txt: "-"),
    //     cellText(txt: data[i]['price']),
    //   ],
    // ),
  ]);
}

// prices(List<Map> priceData) {
//   List price = [];
//   priceData.forEach((element) {
//     price.add(element['price']);
//     price.forEach((element)
//     {

//     });
//   });
// }
