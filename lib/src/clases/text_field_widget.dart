import 'package:flutter/material.dart';

class TextFielWidget extends StatelessWidget {
  final String labelText;
  final String helpertext;
  final String hinText;
  final double width;
  final double height;
  final bool obscureText;
  final Widget suffixIcon;
  final bool visble = true;
  const TextFielWidget({
    @required this.labelText,
    @required this.helpertext,
    @required this.width,
    @required this.height,
    @required this.hinText,
    @required this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(0.1),
        child: TextField(
          scrollPadding: const EdgeInsets.all(0.5),
          obscureText: obscureText,
          decoration: InputDecoration(
              helperText: helpertext,
              labelText: labelText,
              hintText: hinText,
              suffixIcon: suffixIcon,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
      ),
    );
  }
}
