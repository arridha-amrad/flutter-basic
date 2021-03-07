import 'package:flutter/material.dart';

class ErrorTxt extends StatelessWidget {
  final String message;
  final Function onTap;
  ErrorTxt(this.message, this.onTap, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Text(
          "$message, tap to retry",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
