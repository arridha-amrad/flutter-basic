import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:try_flutter/flash_card.dart';
import 'package:try_flutter/flash_card_view.dart';

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
  List<FlashCard> _flashCards = [
    FlashCard(question: "What language is flutter used?", answer: "dart"),
    FlashCard(
        question: "Who is microsoft founder other than Bill-Gates?",
        answer: "Paul Allen"),
    FlashCard(
        question: "What is the capital city of Indonesia?", answer: "Jakarte")
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                    direction: FlipDirection.VERTICAL,
                    front: FlashCardView(
                        text: _flashCards[_currentIndex].question),
                    back: FlashCardView(
                        text: _flashCards[_currentIndex].answer))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      _currentIndex = _currentIndex - 1 < 0
                          ? _flashCards.length - 1
                          : _currentIndex - 1;
                    });
                  },
                  label: Text("Prev"),
                  icon: Icon(Icons.chevron_left),
                ),
                SizedBox(
                  width: 20,
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      _currentIndex = _currentIndex + 1 < _flashCards.length
                          ? _currentIndex + 1
                          : 0;
                    });
                  },
                  label: Text("Next"),
                  icon: Icon(Icons.chevron_right),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
