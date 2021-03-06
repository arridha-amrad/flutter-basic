import 'package:flutter/material.dart';

class FlexibleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexible Widget"),
      ),
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: Row(children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.amber,
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    color: Colors.brown,
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.pink,
                    margin: EdgeInsets.all(5),
                  ),
                ),
              ])),
          Flexible(
              flex: 2,
              child: Container(
                color: Colors.blue,
                margin: EdgeInsets.all(5),
              )),
          Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(5),
                color: Colors.purple,
              )),
        ],
      ),
    );
  }
}
