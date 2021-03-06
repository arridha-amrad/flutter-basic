import 'dart:ui';

import 'package:flutter/material.dart';

ButtonStyle myButton() {
  return ButtonStyle(
      textStyle: MaterialStateProperty.all(
          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      animationDuration: Duration(seconds: 1),
      elevation: MaterialStateProperty.all(3.0),
      minimumSize: MaterialStateProperty.all(Size(200, 50)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue));
}

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Widget"),
      ),
      body: Stack(children: [
        Column(children: [
          Flexible(
              child: Row(
            children: [
              Flexible(
                  child: Container(
                color: Colors.amber,
              )),
              Flexible(
                  child: Container(
                color: Colors.pink,
              )),
            ],
          )),
          Flexible(
              child: Row(
            children: [
              Flexible(
                  child: Container(
                color: Colors.pink,
              )),
              Flexible(
                  child: Container(
                color: Colors.amber,
              )),
            ],
          ))
        ]),
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "alskdjasld alksjdlaskjdalksd lkjasdlk adjas lkjdlkasjdas lkjaskldjas dasj lkajsdlsajlds ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    "alskdjasld alksjdlaskjdalksd lkjasdlk adjas lkjdlkasjdas lkjaskldjas dasj lkajsdlsajlds ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    "alskdjasld alksjdlaskjdalksd lkjasdlk adjas lkjdlkasjdas lkjaskldjas dasj lkajsdlsajlds ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    "alskdjasld alksjdlaskjdalksd lkjasdlk adjas lkjdlkasjdas lkjaskldjas dasj lkajsdlsajlds ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    "alskdjasld alksjdlaskjdalksd lkjasdlk adjas lkjdlkasjdas lkjaskldjas dasj lkajsdlsajlds ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    "alskdjasld alksjdlaskjdalksd lkjasdlk adjas lkjdlkasjdas lkjaskldjas dasj lkajsdlsajlds ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment(0, 0.9),
          child: TextButton(
            onPressed: () {},
            style: myButton(),
            child: Text(
              "Press me",
            ),
          ),
        )
      ]),
    );
  }
}
