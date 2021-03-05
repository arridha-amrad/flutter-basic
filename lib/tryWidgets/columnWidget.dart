import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: Text("Column Widget"),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.green[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text("Hello World"),
            // Text("This world is beautiful"),
            // Expanded(
            //     child: FittedBox(
            //   child: FlutterLogo(),
            //   fit: BoxFit.contain,
            // ))
            Text('We move under cover and we move as one'),
            Text('Through the night, we have one shot to live another day'),
            Text('We cannot let a stray gunshot give us away'),
            Text('We will fight up close, seize the moment and stay in it'),
            Text('It’s either that or meet the business end of a bayonet'),
            Text('The code word is ‘Rochambeau,’ dig me?'),
            Text('Rochambeau!', style: TextStyle(fontSize: 30))
          ],
        ),
      ),
    );
  }
}
