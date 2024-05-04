// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// 🌎 Project imports:
import 'package:navika/src/style.dart';

class SettingsButton extends StatelessWidget {
  final String name;
  final String? sub;
  final Function() function;
  final IconData? icon;

  SettingsButton({
    required this.name,
    this.sub,
    required this.function,
    this.icon,
    super.key,
  });

  final ChromeSafariBrowser browser = ChromeSafariBrowser();

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: function,
    child: Container(
      width: double.infinity,
      padding:
          const EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 10),
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          if (icon != null)
            const SizedBox(
              width: 7,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: fontFamily,
                  fontSize: 17,
                ),
              ),
              if (sub != null)
                Text(
                  sub ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: fontFamily,
                    fontSize: 14,
                  ),
                ),
            ],
          )
        ],
      ),
    ),
  );
}
