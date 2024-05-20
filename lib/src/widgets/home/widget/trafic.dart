// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/widgets/trafic/block.dart';

class HomeWidgetTrafic extends StatefulWidget {
  final List lines;

  const HomeWidgetTrafic({
    required this.lines,
    super.key,
  });

  @override
  State<HomeWidgetTrafic> createState() => _HomeWidgetTraficState();
}

class _HomeWidgetTraficState extends State<HomeWidgetTrafic> {

  List trafic = [];

  Future<void> getTrafic() async {
    if (widget.lines.isEmpty) {
      return;
    }

    List list = [];
    for (var fav in widget.lines) {
      list.add(fav['id']);
    }

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getTrafic(list);

    if (mounted) {
      if (result['value']?['trafic'] != null) {
        setState(() {
          trafic = result['value']?['trafic'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
    child: Wrap(
      children: [
        for (var line in widget.lines)
          TraficBlock(
            line: line,
            trafic: trafic,
            isLoading: trafic.isEmpty,
          ),
      ],
    ),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getTrafic();
    });
  }
}
