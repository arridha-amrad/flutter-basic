import 'package:flutter/material.dart';
import 'package:try_flutter/button_widget.dart';
import 'package:try_flutter/model.dart';
import 'package:try_flutter/preferences.dart';
import 'package:try_flutter/radio_list_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Gender _gender = Gender.MALE;
  Set<Language> _language = Set<Language>();
  bool _isEmployed = false;
  final Preferences _preferences = Preferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences Demo"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            ListTile(
              title: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: "Username"),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Username is required";
                  }
                },
              ),
            ),
            MyRadioListTile(
                title: "Male",
                groupValue: _gender,
                onChanged: (val) => setState(() => _gender = val as Gender)),
            MyRadioListTile(
                title: "Female",
                groupValue: _gender,
                onChanged: (val) => setState(() => _gender = val as Gender)),
            MyRadioListTile(
                title: "Other",
                groupValue: _gender,
                onChanged: (val) => setState(() => _gender = val as Gender)),
            CheckboxListTile(
                title: Text("Dart"),
                value: _language.contains(Language.DART),
                onChanged: (val) {
                  setState(() {
                    _language.contains(Language.DART)
                        ? _language.remove(Language.DART)
                        : _language.add(Language.DART);
                  });
                }),
            CheckboxListTile(
                title: Text("Typescript"),
                value: _language.contains(Language.TYPESCRIPT),
                onChanged: (_) => setState(() =>
                    _language.contains(Language.TYPESCRIPT)
                        ? _language.remove(Language.TYPESCRIPT)
                        : _language.add(Language.TYPESCRIPT))),
            CheckboxListTile(
                title: Text("Kotlin"),
                value: _language.contains(Language.KOTLIN),
                onChanged: (_) {
                  setState(() {
                    _language.contains(Language.KOTLIN)
                        ? _language.remove(Language.KOTLIN)
                        : _language.add(Language.KOTLIN);
                  });
                }),
            CheckboxListTile(
                title: Text("Swift"),
                value: _language.contains(Language.SWIFT),
                onChanged: (_) {
                  setState(() {
                    _language.contains(Language.SWIFT)
                        ? _language.remove(Language.SWIFT)
                        : _language.add(Language.SWIFT);
                  });
                }),
            SwitchListTile(
                title: Text("Is Employed"),
                value: _isEmployed,
                onChanged: (val) {
                  setState(() {
                    _isEmployed = val;
                  });
                }),
            MyButton(buttonText: "Save", onPressed: _savedSettings),
          ],
        ),
      ),
    );
  }

  void _savedSettings() async {
    if (_formKey.currentState!.validate()) {
      Settings settings = Settings(
          gender: _gender,
          language: _language,
          username: _controller.text,
          isEmployed: _isEmployed);

      await _preferences.savedSettings(settings);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Saving...")));
    }
  }

  void _populateFields() async {
    final settings = await _preferences.getSettings();
    setState(() {
      _controller.text = settings.username;
      _gender = settings.gender;
      _isEmployed = settings.isEmployed;
      _language = settings.language;
    });
  }

  @override
  void initState() {
    super.initState();
    _populateFields();
  }
}
