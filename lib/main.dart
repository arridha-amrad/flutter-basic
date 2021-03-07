import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  List<String> restaurants = [
    "McDonald's",
    "KFC",
    "Pizza Hut",
    "Baskin Robbins",
    "Sederhana",
    "Lamun Ombak"
  ];

  int index;

  selectIndex() {
    int number = Random().nextInt(restaurants.length);
    print("number : $number");
    setState(() {
      index = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Where you want to eat?",
              style: TextStyle(fontSize: 18, color: Colors.black45),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: (index != null)
                    ? Text(
                        "${restaurants[index]}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )
                    : null),
            ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.0),
                    backgroundColor: MaterialStateProperty.all(Colors.purple)),
                onPressed: selectIndex,
                child: Text("Pick your restaurant"))
          ],
        ),
      ),
    );
  }
}
