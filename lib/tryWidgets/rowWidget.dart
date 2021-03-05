import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Row Widget'),
          elevation: 0.0,
          backgroundColor: Colors.pink[500],
        ),
        body: Container(
          color: Colors.pink[100],
          child: Column(children: [
            Expanded(
              child: Container(
                color: Colors.grey,
                height: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: Colors.amber,
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      color: Colors.green,
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      color: Colors.red,
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.green[100],
                height: 200,
                child: Row(
                  mainAxisSize: MainAxisSize.max, // default
                  children: [
                    Expanded(child: Text("Delivers feature faster")),
                    Expanded(child: Text("Craft beatiful UI's")),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: FlutterLogo(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.blue[200],
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  FlutterLogo(),
                  Expanded(
                    child: Text(
                        "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
                  ),
                  Icon(Icons.sentiment_very_satisfied),
                ],
              ),
            ))
          ]),
        ));
  }
}
