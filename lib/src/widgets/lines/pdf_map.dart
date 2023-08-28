import 'dart:io';

import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdfx/pdfx.dart';

class PDFMap extends StatefulWidget {
  final String url;
  final double size;
  final bool isLocalData;

  const PDFMap({
    required this.url,
    required this.size,
    this.isLocalData = false,
    super.key,
  });

  @override
  State<PDFMap> createState() => _PDFMapState();
}

class _PDFMapState extends State<PDFMap> with SingleTickerProviderStateMixin {
  late dynamic image;
  bool isError = false;
  bool isLoading = true;
  double width = double.infinity;

  Future<void> getPdf(String url, isLocalData, size) async {
    try {
      PdfDocument document;

      if (isLocalData) {
        Directory directory = await getApplicationDocumentsDirectory();

        Uri uri = Uri.parse(url);
        String name = uri.pathSegments.last;
        document = await PdfDocument.openFile('${directory.path}/dir/$name');
      } else {
        document = await PdfDocument.openData(InternetFile.get(url));
      }

      PdfPage page = await document.getPage(1);

      double pageWidth = page.width / page.height * size;

      final pageImage = (await page.render(
        width: page.width,
        height: page.height,
        format: PdfPageImageFormat.png,
        backgroundColor: '#ffffff',
      ))!;

      await page.close();

      setState(() {
        image = pageImage.bytes;
        isLoading = false;
        isError = false;
        width = pageWidth;
      });
    } catch (err) {
      setState(() {
        isLoading = false;
        isError = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getPdf(widget.url, widget.isLocalData, widget.size);
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (isLoading) const LinearProgressIndicator(),
          if (isError == false)
          Container(
            color: Theme.of(context).colorScheme.background,
            height: widget.size,
            width: width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  height: widget.size,
                  width: width,
                  child: isLoading
                      ? null
                      : Image.memory(
                          image,
                          height: widget.size,
                          width: width,
                        ),
                )
              ],
            ),
          ),
        ],
      );
}
