import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/providers/estadoVenta_providers.dart';

class EstadoVentas extends StatefulWidget {
  @override
  _EstadoVentasState createState() => _EstadoVentasState();
}

recibirEstado(int id) async {
  final estadove = new estadoVentaPro();
  final est = await estadove.cargarEstado(id);
  return est;
}

class _EstadoVentasState extends State<EstadoVentas> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    String imaRout = "assets/images/logo.jpg";
    //final est = recibirEstado(1);
    final est = "Entregado";

    print(est);
    if (est == "En bodega") {
      imaRout = "assets/images/EstadoBodega.jpg";
    }
    if (est == "En camino") {
      imaRout = "assets/images/EstadoCamino.jpg";
    }
    if (est == "Entregado") {
      imaRout = "assets/images/EstadoEntregado.jpg";
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              //areglar para  ruta
              Navigator.pushNamed(
                context,
                "homes",
              );
            }),
        backgroundColor: Colors.white,
        title: Text(
          "Volver",
          style: TextStyle(fontSize: 25, color: Color(0xFF2b7a78)),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Estado de tu Orden",
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Image.asset(
                imaRout,
                width: 300,
                height: 300,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                est,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 75,
            ),
            Container(
              alignment: AlignmentDirectional.bottomEnd,
              child: RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Cancelar Orden",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Icon(Icons.shopping_cart, color: Colors.white),
                  ],
                ),
                color: Colors.red,
                onPressed: () {
                  final estadove = new estadoVentaPro();
                  estadove.delete(id);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
