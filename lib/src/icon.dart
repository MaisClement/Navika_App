// 🎯 Dart imports:
import 'dart:io';

// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

IconData chevronRight = Platform.isIOS ? CupertinoIcons.chevron_right : Icons.chevron_right;

IconData arrowBack = Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back;

IconData refresh = Platform.isIOS ? CupertinoIcons.refresh : Icons.refresh;

IconData more = Platform.isIOS ? CupertinoIcons.ellipsis : Icons.more_horiz;

IconData check = Platform.isIOS ? CupertinoIcons.check_mark : Icons.check;

IconData close = Platform.isIOS ? CupertinoIcons.clear : Icons.close;
