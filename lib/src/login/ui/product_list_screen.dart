import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/clases/text_field_widget.dart';

class ListaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Volver",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: _body(context),
      ),
    );
  }

  bool visibilidad = true;
  void visible() {}

  Widget _body(BuildContext context) {
    return Center();
  }
}
