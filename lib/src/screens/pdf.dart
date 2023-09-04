
import 'package:floating_snackbar/floating_snackbar.dart';
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
  late PdfControllerPinch pdfController;
  bool isLoading = true;

  void onLoadComplete(pdfDocument) {
    setState(() {
      isLoading = false;
    });
  }

  void onError(pdfDocument) {
    FloatingSnackBar(
      message: 'Une erreur s’est produite',
      context: context,
      textColor: mainColor(context),
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: const Color(0xff272727),
    );
  }

  @override
  void initState() {

    Future<PdfDocument> document;
    Uri uri = Uri.parse(globals.pdfUrl);

    if (uri.scheme == 'http' || uri.scheme == 'https') {
      document = PdfDocument.openData(InternetFile.get(globals.pdfUrl));
    } else {
      document = PdfDocument.openFile(globals.pdfUrl);
    }

    pdfController = PdfControllerPinch(
      document: document,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(globals.pdfTitle, style: appBarTitle),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(6.0),
            child: isLoading ? const LinearProgressIndicator() : const SizedBox(height: 0, width: 0),
          ),
        ),
        body: PdfViewPinch(
          onDocumentLoaded: onLoadComplete,
          onDocumentError: onError,
          controller: pdfController,
        ),
      );
}
