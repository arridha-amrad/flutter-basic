import 'package:flutter/material.dart';

class CardNumber extends StatelessWidget {
  final String title;
  final int number;

  CardNumber(this.title, this.number);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 100,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0))),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 70,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0))),
            child: Center(
              child: Text(
                number != null ? '$number' : '-',
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
