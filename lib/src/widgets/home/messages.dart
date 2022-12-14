import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:navika/src/widgets/trafic/block.dart';

Color getSlugColor(severity, [type]){
  if (severity == 0 && (type == null || type == 0)){
    return Colors.transparent;
  } else if (severity == 0 && type != null && type == 1){
    return const Color(0xff008b5b);
  } else if (severity == 5){
    return const Color(0xffeb2031);
  } else if (severity == 4){
    return const Color(0xfff68f53);
  } else if (severity == 3){
    return const Color(0xfff68f53);
  } else if (severity == 2){
    return const Color(0xfff68f53);
  } else if (severity == 1){
    return const Color(0xff005bbc);
  } else if (type != null && type == 1) {
    return const Color(0xff008b5b);
  } else {
    return Colors.transparent;
  }
}

String getTime(String time){
  DateTime dttime = DateTime.parse(time);

  String dtday = dttime.day < 10 ? '0${dttime.day}' : dttime.day.toString();
  String dtmonth = dttime.month < 10 ? '0${dttime.month}' : dttime.month.toString();
  String dtyear = dttime.year.toString();
  String dthour = dttime.hour < 10 ? '0${dttime.hour}' : dttime.hour.toString();
  String dtminute = dttime.minute < 10 ? '0${dttime.minute}' : dttime.minute.toString();

  return '$dtday/$dtmonth/$dtyear $dthour:$dtminute';
}

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
	Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left:15.0, top:10, right:15.0, bottom:10.0),
    margin: isMarginDisabled ? null : const EdgeInsets.only(top: 10, left: 10, right: 10, bottom:10.0),
    decoration: BoxDecoration(
      color: getSlugBack(message['severity'], 1),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (message['message']['title'] != null)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right:5),
                  child: Image(
                    image: getSlugImage(message['severity'], 1),
                    height: 25,
                  ),
                ),
                Expanded(
                  child: Wrap(
                    children: [
                      Text(message['message']['title'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  )
                )
              ],
            ),
          ),
          
        Text(message['message']['text'],
          style: const TextStyle(
            fontSize: 16
          ),
        ),
        Text('Mis ?? jour: ${getTime(message['updated_at'])}',
          style: const TextStyle(
            fontSize: 12
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        
        if (message['message']['link'] != null && message['message']['button'] != null && message['message']['link'] != '' && message['message']['button'] != '')
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await browser.open(
                  url: Uri.parse( message['message']['link'] ),
                  options: ChromeSafariBrowserClassOptions());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: getSlugColor(message['severity'], 1),
                foregroundColor: const Color(0xffffffff),
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              child: Text(message['message']['button']),
            ),
          )
      ]
    ),
  );
}
