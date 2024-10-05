import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/features/home/screens/price_management/widgets/table_cell.dart';

class TableInfo extends StatelessWidget {
  const TableInfo({super.key, required this.tableData});
  final List<TableRow> tableData;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
      ),
      // Adds borders to the table
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        // 0: FractionColumnWidth(.2),
        // 1: FractionColumnWidth(.5),
        // 2: FractionColumnWidth(.2),
        // 3: FractionColumnWidth(.1),
      },
      children: [
        TableRow(children: [
          buildTableCell("Type", isHeader: true),
          buildTableCell("Capacity", isHeader: true),
          buildTableCell("Price", isHeader: true),
          // buildTableCell("Icon", isHeader: true),
        ]),
        // Remaining 3 rows (data rows)
        for (int row = 1; row <= tableData.length; row++) tableData[row - 1]
      ],
    );
  }
}
