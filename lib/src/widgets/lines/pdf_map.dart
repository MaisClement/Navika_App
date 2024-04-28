// 🎯 Dart imports:
import 'dart:io';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:internet_file/internet_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';

class PDFMap extends StatefulWidget {
  final String url;
  final double height;
  final bool isLocalData;
  final Function setBlockScroll;

  const PDFMap({
    required this.url,
    required this.height,
    required this.setBlockScroll,
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
  bool blockScroll = false;
  double width = 0;

  Future<void> getPdf(String url, isLocalData, height) async {
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

      double pageWidth = page.width / page.height * height;

      final pageImage = (
        await page.render(
        width: page.width * 3,
        height: page.height * 3,
        format: PdfPageImageFormat.png,
        backgroundColor: '#ffffff',
        )
      )!;

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

  void setBlockScroll(value) {
    widget.setBlockScroll(value);
    setState(() {
      blockScroll = value;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getPdf(widget.url, widget.isLocalData, widget.height);
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (isLoading) const LinearProgressIndicator(),
          if (isError == false)
            Container(
              color: Theme.of(context).colorScheme.background,
              height: widget.height,
              width: width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: blockScroll
                    ? const NeverScrollableScrollPhysics()
                    : const ScrollPhysics(),
                children: [
                  SizedBox(
                    height: widget.height,
                    width: width,
                    child: isLoading
                        ? null
                        : PinchZoomReleaseUnzoomWidget(
                            twoFingersOn: () => setBlockScroll(true),
                            twoFingersOff: () => Future.delayed(
                              PinchZoomReleaseUnzoomWidget.defaultResetDuration,
                              () => setBlockScroll(false),
                            ),
                            child: Image.memory(
                              image,
                              height: widget.height,
                              width: width,
                            ),
                          ),
                  )
                ],
              ),
            ),
        ],
      );
}
