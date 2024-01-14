import 'package:flutter/material.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/icons/icons.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/widgets/utils/switch_line.dart';

bool isInList(List lines, String id) {
  if (lines.isNotEmpty) {
    for (var line in lines) {
      if (line['id'] == id) {
        return true;
      }
    }
  }
  return false;
}

List orderLine(List array) {
  List<String> typeList = [
    'nationalrail',
    'rail',
    'funicular',
    'metro',
    'tram',
    'bus',
  ];

  array.sort((a, b) {
    int ta = typeList.indexOf(a['mode']);
    int tb = typeList.indexOf(b['mode']);

    if (a['code'] == 'SNCF') {
      return -1;
    } else if (b['code'] == 'SNCF') {
      return 1;
    }

    if (a['name'] == 'TER') {
      return 1;
    } else if (b['name'] == 'TER') {
      return -1;
    }

    if (ta != tb) {
      return (ta < tb) ? -1 : 1;
    }

    if (a['code'] == b['code']) {
      return 0;
    }

    return (a['code'].compareTo(b['code']) < 0) ? -1 : 1;
  });

  return array;
}



class BottomAvoidLine extends StatefulWidget {
  final List journeys;
  final Function update;

  const BottomAvoidLine({
    required this.journeys,
    required this.update,
    super.key,
  });

  @override
  State<BottomAvoidLine> createState() => _BottomAvoidLineState();
}

class _BottomAvoidLineState extends State<BottomAvoidLine> with SingleTickerProviderStateMixin {

  List lines = [];

  void getLines(journeys) {
    List _lines = [...globals.forbiddenLines];

    for (var journey in journeys) {
      for (var section in journey['sections']) {
        
        if (section['type'] == 'public_transport') {
          // if line doesnt contain line

          if (!isInList(_lines, section['informations']['line']['id'])) {
            _lines.add(section['informations']['line']);
          }
        }
      }
    }
    setState(() {
      lines = orderLine(_lines);
    });
  }

  void handleChange(value, line) {
    setState(() {
      if (!value) {
        globals.forbiddenLines.add(line);
      } else {
        globals.forbiddenLines.removeWhere((el) => el['id'] == line['id']);
        if (!isInList(lines, line['id'])) {
          lines.add(line);
        }
      }
      return;
    });
  }

  @override
  void initState() {
    getLines(widget.journeys);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: accentColor(context).withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ]),
      child: Container(
        padding: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Éviter une ligne',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Segoe Ui',
                color: accentColor(context),
              ),
            ),
            Divider(
              color: accentColor(context),
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(children: [
              Text(
                'Décocher une ligne pour éviter celle-ci',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Segoe Ui',
                  color: accentColor(context),
                ),
              ),
            ]),
            for (var line in lines)
              SwitchLine(
                key: Key(line['id']),
                line: line,
                value: !isInList(globals.forbiddenLines, line['id']),
                function: (bool value) => handleChange(value, line),
              ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                child: const Text('Valider'),
                onPressed: () {
                  widget.update();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
