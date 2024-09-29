  // Helper function to build table cells with optional header styling
  import 'package:flutter/material.dart';

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