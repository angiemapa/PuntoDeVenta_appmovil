import 'package:flutter/material.dart';

class List extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.ac_unit),
          onPressed: () => {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () => {},
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
