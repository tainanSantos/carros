import 'package:flutter/material.dart';

class TextError extends StatelessWidget {
  String msg;
  Function onPresed;

  TextError(this.msg, {this.onPresed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPresed,
        child: Text(
          msg,
          style: TextStyle(color: Colors.red, fontSize: 22),
        ),
      ),
    );
  }
}
