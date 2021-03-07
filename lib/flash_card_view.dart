import 'package:flutter/material.dart';

class FlashCardView extends StatelessWidget {
  final String text;

  FlashCardView({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
