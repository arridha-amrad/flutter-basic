import 'package:flutter/material.dart';
import 'package:try_flutter/data_service.dart';
import 'package:try_flutter/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  TextEditingController _myTextController = TextEditingController();
  WeatherResponse? _response;

  final _formKey = GlobalKey<FormState>();

  final DataService dataService = DataService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            // color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${_response?.temperatureInfo.temperature.toString() ?? ''}°C",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                (_response?.iconUrl != null)
                    ? Image.network(_response!.iconUrl!)
                    : Text(""),
                // Image.network(_response?.iconUrl ?? ""),
                Text(
                  _response?.cityName ?? "",
                  style: TextStyle(fontSize: 20),
                ),
                Text(_response?.weatherInfo.description ?? ""),
                SizedBox(
                  width: 200,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your city';
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(hintText: "City..."),
                      controller: _myTextController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child:
                      ElevatedButton(onPressed: search, child: Text("Search")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void search() async {
    if (_formKey.currentState!.validate()) {
      final response = await dataService.getWeather(_myTextController.text);
      setState(() {
        _response = response;
      });
    }
  }
}
