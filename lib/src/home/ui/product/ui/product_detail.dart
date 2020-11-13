import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/home/data/models/models.dart';

class ProductDetail extends StatelessWidget {
  final ProductResultModel model;
  const ProductDetail({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    child: Text(model.nombre,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900))),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Image.memory(model.imagen)),
                Divider(color: Colors.black, height: 1),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: Text(model.descripcion,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 25,
                      )),
                  
                ),
              ],
            ),
          )),
    ));
  }
}
