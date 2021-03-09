import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  MyText(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
    );
  }
}
