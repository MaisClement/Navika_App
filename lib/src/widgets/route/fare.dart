import 'package:flutter/material.dart';

class Fare extends StatelessWidget {
  final Map journey;

  const Fare({
    required this.journey,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left:15.0, top:10, right:15.0, bottom:10.0),
    margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom:10.0),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right:5),
                child: const Image(
                  image: AssetImage('assets/img/ticket.png'),
                  height: 25,
                ),
              ),
              Expanded(
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Text('Prix du billet : ${journey['fare'].toStringAsFixed(2)}€',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                  ],
                )
              )
            ],
          ),
        ),
      ]
    ),
  );
}
