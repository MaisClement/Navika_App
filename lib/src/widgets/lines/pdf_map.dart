import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';

import 'package:pdfx/pdfx.dart';

class PDFMap extends StatefulWidget {
  final String url;
  final double size;

  const PDFMap({
    required this.url,
    required this.size,
    super.key,
  });

  @override
  State<PDFMap> createState() => _PDFMapState();
}

class _PDFMapState extends State<PDFMap> with SingleTickerProviderStateMixin {
  late dynamic image;
  bool isLoading = true;
  double width = double.infinity;

  Future<void> getPdf(String url, size) async {
    final document = await PdfDocument.openData(InternetFile.get(url));

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
      width = pageWidth;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getPdf(widget.url, widget.size);
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (isLoading) const LinearProgressIndicator(),
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
