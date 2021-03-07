import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> _selections = [false, true, false];

  void updateSelection(int selectedIndex) {
    setState(() {
      for (var i = 0; i < _selections.length; i++) {
        _selections[i] = selectedIndex == i;
      }
    });
  }

  String tip;

  final _controller = TextEditingController();

  void calculateTip() {
    if (_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please input your ammount"),
      ));
      return;
    }
    var amount = double.tryParse(_controller.text);
    var selectedIndex = _selections.indexWhere((element) => element);
    var percentage = [0.1, 0.15, 0.2][selectedIndex];

    String tipAmount = (amount * percentage).toStringAsFixed(2);

    setState(() {
      tip = "\$$tipAmount";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (tip ?? "0"),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text("Total Amount"),
            SizedBox(
              width: 80,
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "\$100",
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ToggleButtons(
                  children: [Text('10%'), Text('15%'), Text('20%')],
                  isSelected: _selections,
                  onPressed: updateSelection),
            ),
            ElevatedButton(
                style: ButtonStyle(elevation: MaterialStateProperty.all(0.0)),
                onPressed: calculateTip,
                child: Text("Calculate Tip"))
          ],
        ),
      ),
    );
  }
}
