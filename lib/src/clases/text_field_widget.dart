import 'package:flutter/material.dart';

class TextFielWidget extends StatelessWidget {
  final String labelText;
  final String helpertext;
  final String hinText;
  final double width;
  final bool obscureText;

  const TextFielWidget({
    @required this.labelText,
    @required this.helpertext,
    @required this.width,
    @required this.hinText,
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: width,
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            helperText: helpertext,
            labelText: labelText,
            hintText: hinText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
