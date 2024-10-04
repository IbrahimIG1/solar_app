import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class LocalPdfScreen extends StatelessWidget {
  const LocalPdfScreen({super.key, required this.pdfPath});
  final String pdfPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFView(
        filePath: pdfPath,
      ),
    );
  }
}
