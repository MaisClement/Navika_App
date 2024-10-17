// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// 🌎 Project imports:
import 'package:navika/src/style.dart';

class SettingsLink extends StatelessWidget {
  final String name;
  final String url;
  final IconData? icon;

  SettingsLink({
    required this.name,
    required this.url,
    this.icon,
    super.key,
  });

  final ChromeSafariBrowser browser = ChromeSafariBrowser();

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
          child: icon != null
              ? Row(
                  children: [
                    Icon(
                      icon,
                      size: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: fontFamily,
                        fontSize: 17,
                      ),
                    )
                  ],
                )
              : Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: fontFamily,
                    fontSize: 17,
                  ),
                ),
        ),
        onTap: () async {
          await browser.open(
            url: WebUri(url)
          );
        },
      );
}
