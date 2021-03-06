import 'package:flutter/material.dart';

class MediaQueryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Media Query"),
        ),
        body: (MediaQuery.of(context).orientation == Orientation.portrait)
            ? Column(
                children: generatedWidget(),
              )
            : Row(
                children: generatedWidget(),
              ));
  }

  List<Widget> generatedWidget() {
    return <Widget>[
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
      Container(
        color: Colors.purple,
        height: 100,
        width: 100,
      ),
      // Container(
      //   color: Colors.pink,
      //   height: MediaQuery.of(context).size.height / 2,
      //   width: MediaQuery.of(context).size.width / 3,
      // ),
    ];
  }
}
