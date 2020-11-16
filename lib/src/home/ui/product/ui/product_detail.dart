import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proyecto_administracion/src/home/bloc/home_bloc.dart';
import 'package:proyecto_administracion/src/home/data/models/models.dart';

class ProductDetail extends StatefulWidget {
  final ProductResultModel model;
  final SaleModel saleModel;
  const ProductDetail({
    Key key,
    this.model,
    @required this.saleModel,
  }) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int amount = 0;
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
                    child: Text(widget.model.nombre,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900))),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Image.memory(widget.model.imagen)),
                Divider(color: Colors.black, height: 1),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: Text(widget.model.descripcion,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 25,
                      )),
                ),
                Divider(color: Colors.black, height: 1),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cantidad a agregar: $amount"),
                      Row(
                        children: [
                          RaisedButton(
                            onPressed: (amount != 0)
                                ? () {
                                    setState(() {
                                      amount--;
                                    });
                                  }
                                : null,
                            child: Icon(Icons.remove),
                          ),
                          RaisedButton(
                            onPressed: () {
                              setState(() {
                                amount++;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                      RaisedButton(
                        onPressed: (amount != 0)
                            ? () {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('¿Desea añadir al carrito?'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Text(widget.model.nombre),
                                            Text("Cantidad: $amount"),
                                            Text(
                                                "Total: ${amount * widget.model.precio}")
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        RaisedButton(
                                          child: Text('Cancelar'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        RaisedButton(
                                          child: Text('Añadir'),
                                          onPressed: () {
                                            widget.saleModel.addDetailSale(widget.model, amount);
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            : null,
                        child: Text("Agregar al carrito"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
