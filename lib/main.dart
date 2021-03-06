import 'package:flutter/material.dart';
import 'package:try_flutter/learnHttpRequest/home.dart';
// import 'package:try_flutter/simpleView/customCard.dart';
// import 'package:try_flutter/tryWidgets/fabWidget.dart';
// import 'package:try_flutter/tryWidgets/inkWellWidget.dart';
// import 'package:try_flutter/tryWidgets/mediaQueryWidget.dart';
// import 'package:try_flutter/tryWidgets/stackWidget.dart';
// import 'package:try_flutter/tryWidgets/textFieldWidget.dart';
// import 'package:try_flutter/tryWidgets/flexibleWidget.dart';
// import 'package:try_flutter/tryWidgets/stackWidget.dart';
// import 'package:try_flutter/tryWidgets/columnWidget.dart';
// import 'package:try_flutter/tryWidgets/listViewWidget.dart';
// import 'package:try_flutter/tryWidgets/rowWidget.dart';
// import 'package:try_flutter/tryWidgets/singleChildScrollViewWidget.dart';
// import 'package:try_flutter/tryWidgets/textWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeHttpRequest());
  }
}
