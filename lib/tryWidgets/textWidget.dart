import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Widgets"),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Hello World",
              style: TextStyle(
                  color: Colors.green[500],
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              width: 170,
              height: 100,
              color: Colors.green[50],
              alignment: Alignment.center,
              child: Text(
                "Hello Ruth! How is it going. Long time no see. Wish you luck",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            Text.rich(TextSpan(text: "Hello", children: <TextSpan>[
              TextSpan(
                  text: " beautiful",
                  style: TextStyle(
                      color: Colors.pink[800], fontWeight: FontWeight.bold)),
              TextSpan(
                  text: " world.",
                  style: TextStyle(
                      color: Colors.green[500], fontWeight: FontWeight.bold))
            ]))
          ],
        ),
      ),
    );
  }
}
