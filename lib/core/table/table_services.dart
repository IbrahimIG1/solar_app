import 'package:flutter/material.dart';
import 'package:solar/core/table/ui/table_cell.dart';

class TableSevices {
  TableSevices();

  //* Add row has 3 cells in table
  addRowInTable(
      String name, String capacity, String price, List<TableRow> tableData) {
    //* this tableData has all data
    tableData.add(TableRow(children: [
      buildTableCell(name),
      buildTableCell(capacity),
      buildTableCell(price),
      // buildTableCell(icon),
    ]));
  }
}
