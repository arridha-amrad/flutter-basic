import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  List<Widget> widgets = [];
  int counter = 0;

  // _ListViewWidgetState() {
  //   for (var i = 0; i < 20; i++) {
  //     widgets.add(Text(
  //       "Data ke - " + i.toString(),
  //       style: TextStyle(fontSize: 50.0),
  //     ));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List View Widget"),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        widgets.add(Text("Data ke - " + counter.toString()));
                        counter++;
                      });
                    },
                    child: Text("Add widgets")),
                TextButton(
                    onPressed: () {
                      setState(() {
                        widgets.removeLast();
                        counter--;
                      });
                    },
                    child: Text("remove widgets")),
              ],
            ),
            Column(
              children: widgets,
            )
          ],
        ));
  }
}
