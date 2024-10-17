// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// 🌎 Project imports:
import 'package:navika/src/icon.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/utils.dart';

bool isReduced(message) {
  if (message['message']['is_reduced'] != null) {
    return message['message']['is_reduced'];
  }
  return message['message']['link'] != null && message['severity'] < 4;
}

Future<void> handleOnTap(context, uri) async {
  final ChromeSafariBrowser browser = ChromeSafariBrowser();

  // if uri starts with 'app://' then open the app
  if (uri.startsWith('app://')) {
    RouteStateScope.of(context).go(uri.substring(5));
  } else {
    await browser.open(url: WebUri(uri));
  }
}

class HomeMessage extends StatelessWidget {
  final Map message;
  final bool isMarginDisabled;
  final void Function()? onTap;

  const HomeMessage({
    required this.message,
    this.isMarginDisabled = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => isReduced(message)
      ? Padding(
          padding: isMarginDisabled ? const EdgeInsets.all(0) : const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10.0),
          child: Card(
            color: getSlugColor(message['severity'], true).withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                image: message['message']['img'] != null
                    ? DecorationImage(
                        image: NetworkImage(message['message']['img']),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      )
                    : null,
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () async {
                  handleOnTap(context, message['message']['link']);
                },
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      if (message['message']['icon'] != null)
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: Image(
                            image: NetworkImage(message['message']['icon']),
                            height: 30,
                          ),
                        )
                      else
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
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: message['message']['img'] != null ? const Color(0xffffffff) : null,
                          ),
                        ),
                      ),
                      Icon(
                        chevronRight,
                        color: message['message']['img'] != null ? const Color(0xffffffff) : Theme.of(context).colorScheme.onSurface,
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
          margin: isMarginDisabled ? null : const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10.0),
          decoration: BoxDecoration(
            color: getSlugColor(message['severity'], true).withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 15.0, top: 10, right: 15.0, bottom: 5),
            decoration: BoxDecoration(
              image: message['message']['img'] != null
                  ? DecorationImage(
                      image: NetworkImage(message['message']['img']),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    )
                  : null,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: message['message']['img'] != null ? const Color(0xffffffff) : null,
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              Text(
                message['message']['text'],
                style: TextStyle(
                  color: message['message']['img'] != null ? const Color(0xffffffff) : null,
                ),
              ),
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
                      handleOnTap(context, message['message']['link']);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: getSlugColor(message['severity'], true),
                      foregroundColor: const Color(0xffffffff),
                    ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                    child: Text(message['message']['button']),
                  ),
                )
            ]),
          ),
        );
}
