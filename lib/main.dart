import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: LearnStFull());
  }
}

class LearnStFull extends StatefulWidget {
  @override
  _LearnStFullState createState() => _LearnStFullState();
}

class _LearnStFullState extends State<LearnStFull> {
  int number = 0;

  void tambah() {
    setState(() => number += 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Statefull Widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(number.toString()),
            TextButton(
              onPressed: tambah,
              child: Text(
                "add",
                style: TextStyle(fontSize: number.toDouble()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
