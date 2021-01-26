import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onClickLogin;
  final bool showProgress;

  const AppButton(
      {Key key, this.text, this.onClickLogin, this.showProgress = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: RaisedButton(
        color: Colors.blue,
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
        onPressed: onClickLogin,
      ),
    );
  }
}
