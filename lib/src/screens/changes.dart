import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:navika/src/data/app.dart' as app;
import 'package:markdown/markdown.dart' as md;
import 'package:navika/src/api.dart';

import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/error_block.dart';

class Changes extends StatefulWidget {
  const Changes({super.key});

  @override
  State<Changes> createState() => _ChangesState();
}

class _ChangesState extends State<Changes> {

  ApiStatus error = ApiStatus.ok;
  bool isLoading = true;
  String data = '';

  Future _getChanges(String url) async {
    ApiStatus _error = ApiStatus.ok;
    bool _isLoading = true;
    String _data = '';

    if (kDebugMode) {
      print({'INFO_request', url});
    }

    
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        _data = utf8.decode(response.bodyBytes);
        _error = ApiStatus.ok;
      } else {
        _error = ApiStatus.serverException;
      }
    } on SocketException {
      _error = ApiStatus.socketException;
    } on TimeoutException {
      _error = ApiStatus.timeoutException;
    } catch (e) {
      _error = ApiStatus.unknownException;
    }

    setState(() {
      data = _data;
      error = _error;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getChanges(app.API_CHANGES);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor(context),
          leading: GestureDetector(
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Nouveautés',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Segoe Ui',
              color: Colors.white,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(6.0),
            child: isLoading
            ? LinearProgressIndicator(
                backgroundColor: Theme.of(context).colorScheme.primary,
                color: Theme.of(context).colorScheme.onPrimary
              ) 
            : const SizedBox(height: 0, width: 0),
          ),
        ),
        backgroundColor: mainColor(context),
        body: 
        error != ApiStatus.ok
          ? ErrorBlock(
              error: error,
            )
          : Markdown(
            data: data,
            selectable: true,
            styleSheet: MarkdownStyleSheet(
              h1: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Segoe Ui',
                color: Colors.white,
              ),
              h2: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Segoe Ui',
                color: Colors.white,
              ),
              h3: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Segoe Ui',
                color: Colors.white,
              ),
              p: const TextStyle(
                color: Colors.white,
              ),
              horizontalRuleDecoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 10,
                    color: Colors.transparent,
                  ),
                ),
              ),
              blockquoteDecoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
              )
            ),
            //extensionSet: md.ExtensionSet(
            //  md.ExtensionSet.gitHubFlavored.blockSyntaxes,
            //  <md.InlineSyntax>[
            //    md.EmojiSyntax(),
            //    ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
            //  ],
            //),
          )
      );
}
