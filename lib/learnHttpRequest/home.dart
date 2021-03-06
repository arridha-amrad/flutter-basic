import 'package:flutter/material.dart';
import 'package:try_flutter/learnHttpRequest/models/PostResult.dart';
import 'package:try_flutter/learnHttpRequest/models/User.dart';

class HomeHttpRequest extends StatefulWidget {
  @override
  _HomeHttpRequestState createState() => _HomeHttpRequestState();
}

class _HomeHttpRequestState extends State<HomeHttpRequest> {
  PostResult postResult;
  User user;
  String output = "no data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("API Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Text((postResult != null)
            //     ? "postResultName : '${postResult.name}', postResultJob : '${postResult.job}'"
            //     : "No data"),
            // Text((user != null)
            //     ? "name : '${user.name}', id : '${user.id}'"
            //     : "No user"),
            Text(output),
            TextButton(
              onPressed: () {
                User.getUsers('2').then((users) {
                  output = "";
                  for (var i = 0; i < users.length; i++) {
                    output = output + "[ " + users[i].name + " ]";
                  }
                  setState(() {});
                });
                // User.connectToAPI('2').then((value) {
                //   print("value : ${value.name}");
                //   setState(() {
                //     user = value;
                //   });
                // });
                // PostResult.connectToAPI("Yanto", "Sopir").then((value) {
                //   print("Value : '${value.name}'");
                //   setState(() {
                //     postResult = value;
                //   });
                // });
              },
              child: Text("GET"),
            )
          ],
        ),
      ),
    );
  }
}
