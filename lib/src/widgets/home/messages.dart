import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:navika/src/utils.dart';

class HomeMessage extends StatelessWidget {
  final Map message;
  final bool isMarginDisabled;
  final void Function()? onTap;

  HomeMessage({
    required this.message,
    this.isMarginDisabled = false,
    this.onTap,
    super.key,
  });

  final ChromeSafariBrowser browser = ChromeSafariBrowser();

  @override
  Widget build(BuildContext context) => message['message']['link'] != null &&
          message['severity'] < 4
      ? Padding(
        padding: isMarginDisabled
              ? const EdgeInsets.all(0)
              : const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 10.0),
        child: Card(
            color: getSlugColor(message['severity'], true).withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              height: 65,
              child: InkWell(
                onTap: () async {
                  await browser.open(
                      url: Uri.parse(message['message']['link']),
                      options: ChromeSafariBrowserClassOptions());
                },
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Image(
                          image: getSlugImage(message['severity'], 1),
                          height: 30,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          message['message']['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
      )
      : Container(
          padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15.0, bottom: 5),
          margin: isMarginDisabled
              ? null
              : const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 10.0),
          decoration: BoxDecoration(
            color: getSlugColor(message['severity'], true).withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: Image(
                      image: getSlugImage(message['severity'], 1),
                      height: 25,
                    ),
                  ),
                  Expanded(
                      child: Wrap(
                    children: [
                      Text(
                        message['message']['title'],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Text(message['message']['text']),
            const SizedBox(
              height: 5,
            ),
            if (message['message']['link'] != null &&
                message['message']['button'] != null &&
                message['message']['link'] != '' &&
                message['message']['button'] != '')
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await browser.open(
                        url: Uri.parse(message['message']['link']),
                        options: ChromeSafariBrowserClassOptions());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: getSlugColor(message['severity'], true),
                    foregroundColor: const Color(0xffffffff),
                  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  child: Text(message['message']['button']),
                ),
              )
          ]),
        );
}
