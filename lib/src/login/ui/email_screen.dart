import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          )
        ],
      ),
    );
  }
}
