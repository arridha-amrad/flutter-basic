import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _fontSize = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.done,
                maxLines: null,
                style: TextStyle(fontSize: _fontSize),
              ),
            ),
            Slider(
                min: 30,
                max: 200,
                value: _fontSize,
                onChanged: (newSize) {
                  setState(() {
                    _fontSize = newSize;
                  });
                })
          ],
        ),
      ),
    );
  }
}
