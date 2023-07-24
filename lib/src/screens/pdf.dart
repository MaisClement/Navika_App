
import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:navika/src/style/style.dart';
import 'package:pdfx/pdfx.dart';
import 'package:navika/src/data/global.dart' as globals;

class PDFViewer extends StatefulWidget {
  const PDFViewer({super.key});

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  final String title = 'Info PDFViewer';

  late PdfControllerPinch pdfController;
  bool isLoading = true;

  @override
  void initState() {
    pdfController = PdfControllerPinch(
      document: PdfDocument.openData( InternetFile.get( globals.pdfUrl ) ),
    );
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(title, style: appBarTitle),
      ),
      body: 
        isLoading
        ? LinearProgressIndicator()
        : PdfViewPinch(
          controller: pdfController,
        )
      );
}
