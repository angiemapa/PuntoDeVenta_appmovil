import 'dart:ffi';

import 'package:flutter/material.dart';

class EstadoVentas extends StatefulWidget {
  @override
  _EstadoVentasState createState() => _EstadoVentasState();
}

class _EstadoVentasState extends State<EstadoVentas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 40,
          ),
          onPressed: () {},
        ),
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
              //condicion para cambio de imagen
              child: Image.asset(
                "assets/images/bodega.jpg",
                width: 300,
                height: 300,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "BODEGA",
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
                onPressed: () {},
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
