import 'package:flutter/material.dart';

class InkWellWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("InkWell"),
        ),
        body: Center(
          child: Material(
            child: InkWell(
              child:
                  Container(padding: EdgeInsets.all(12), child: Text("Press")),
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Ink well demo")));
              },
            ),
          ),
        ));
  }
}
