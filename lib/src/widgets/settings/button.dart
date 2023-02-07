import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SettingsButton extends StatelessWidget {
  final String name;
  final Function() function;
  final IconData? icon;

  SettingsButton({
    required this.name,
    required this.function,
    this.icon,
    super.key,
  });

  final ChromeSafariBrowser browser = ChromeSafariBrowser();

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: InkWell(
          onTap: function,
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 10),
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe Ui',
                          fontSize: 17,
                        ),
                      )
                    ],
                  )
                : Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      fontSize: 17,
                    ),
                  ),
          ),
        ),
      );
}
