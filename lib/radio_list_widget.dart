import 'package:flutter/material.dart';
import 'package:try_flutter/model.dart';

class MyRadioListTile extends StatelessWidget {
  final String title;
  final void Function(Gender?)? onChanged;
  final Gender groupValue;

  MyRadioListTile(
      {required this.title, required this.onChanged, required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        activeColor: Colors.pink,
        title: Text(title),
        value: (title == "Male")
            ? Gender.MALE
            : (title == "Female")
                ? Gender.FEMALE
                : Gender.OTHER,
        groupValue: groupValue,
        onChanged: onChanged);
  }
}
