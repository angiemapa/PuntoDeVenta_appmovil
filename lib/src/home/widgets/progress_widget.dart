import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final String title;
  ProgressWidget({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Card(
          elevation: 5,
          child: ListTile(
            title: Text(title),
            subtitle: Text("Cargando..."),
            trailing: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
