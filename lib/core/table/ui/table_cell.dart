import 'package:flutter/material.dart';

//* table Header Cells in Price Management Screen
TableRow tableHeaderCells() => TableRow(children: [
      buildTableCell("Type", isHeader: true),
      buildTableCell("Capacity", isHeader: true),
      buildTableCell("Price", isHeader: true),
      // buildTableCell("Icon", isHeader: true),
    ]);

//* Helper function to build table cells with optional header styling
Widget buildTableCell(String text, {bool isHeader = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0), // Padding inside each cell
    child: Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: isHeader
            ? FontWeight.bold
            : FontWeight.normal, // Bold text for headers
      ),
      textAlign: TextAlign.center,
    ),
  );
}
