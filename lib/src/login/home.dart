import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/login/ui/EstadoVenta.dart';

class homes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('prueba')),
      body: Container(
        child: Center(
          child: Text('vaca lola'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit),
          onPressed: () {
            Navigator.pushNamed(context, "Estado/Venta", arguments: 1);
          }),
    );
  }
}
