import 'package:flutter/material.dart';

class SnackbarWidget {
  final BuildContext context;
  final String text;
  final Color color;

  SnackbarWidget({
    @required this.context,
    @required this.text,
    @required this.color,
  });

  void showSnackbar() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: color,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
