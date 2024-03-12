import 'package:flutter/material.dart';
import 'package:navika/src/style.dart';

import 'package:navika/src/widgets/icons/icons.dart';

class LinesListButton extends StatelessWidget {
  final bool isLoading;
  final Map line;
  final bool isLight;
  final void Function() onTap;

	const LinesListButton({
    required this.isLoading,
    required this.line,
    required this.onTap,
    this.isLight = false,
		super.key,
	});

	@override
	Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Opacity(
      opacity: isLoading ? 0.4 : 1,
      child: Container(
        padding: const EdgeInsets.only(left:20.0, top:5.0,right:5.0,bottom:5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icones(
                  line: line,
                  i: 0,
                  brightness: isLight ? Brightness.light : Theme.of(context).colorScheme.brightness,
                  size: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                if (line['name'] != line['code'])
                  Expanded(
                    child: Text(line['name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Segoe Ui',
                        color: accentColor(context),
                      ),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
              ],
            ),
            
            if (line['agency'] != null)
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text('${line['agency']['area']}, ${line['agency']['name']}',
                  style: TextStyle(
                    color: isLight ? Colors.white : Colors.grey,
                    fontFamily: 'Segoe Ui',
                  ),
                ),
              ),
          ]
        )
      ),
    ),                
  );
}
