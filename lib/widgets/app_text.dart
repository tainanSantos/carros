import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String labelText;
  String hintText;
  bool password = false;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;

  AppText(
    this.labelText,
    this.hintText, {
    Key key,
    this.controller,
    this.validator,
    this.password = false,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) FocusScope.of(context).requestFocus(focusNode);
      },
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
