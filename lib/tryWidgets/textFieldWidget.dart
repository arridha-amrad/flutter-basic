import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController controller = TextEditingController(text: "");
  bool errorEmail = false;

  printLatestValue() {
    print("Second text field: ${controller.text}");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // listen for changes in textfield / textFormField
    controller.addListener(printLatestValue);
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Field Widget"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    errorEmail = false;
                  });
                },
                controller: controller,
                decoration: InputDecoration(
                    suffixIcon: (errorEmail)
                        ? Icon(
                            Icons.error,
                            color: Colors.red,
                          )
                        : null,
                    border: OutlineInputBorder(),
                    labelText: "Email"),
                validator: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      errorEmail = true;
                    });
                    return "Please enter some text";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Text("Submit")),
              TextField(
                // obscureText: true,
                maxLength: 5,
                onChanged: (value) {
                  setState(() {});
                },
                controller: controller,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4),
                    suffixIcon: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    prefixIcon: Icon(Icons.access_alarm),
                    labelText: "Username",
                    border: OutlineInputBorder()),
              ),
              TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[100],
                      labelText: "email",
                      labelStyle: TextStyle(color: Colors.blue))),
              Text(controller.text)
            ],
          ),
        ),
      ),
    );
  }
}
