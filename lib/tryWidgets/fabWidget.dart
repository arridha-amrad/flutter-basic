import 'package:flutter/material.dart';

class FabWidget extends StatefulWidget {
  @override
  _FabWidgetState createState() => _FabWidgetState();
}

class _FabWidgetState extends State<FabWidget> {
  FocusNode myFocusNode;

  @override
  void dispose() {
    super.dispose();
    myFocusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating Action Button"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Username"),
              ),
            ),
            TextFormField(
              focusNode: myFocusNode,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Email"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myFocusNode.requestFocus();
        },
        elevation: 0.0,
        child: Icon(Icons.edit),
      ),
    );
  }
}
