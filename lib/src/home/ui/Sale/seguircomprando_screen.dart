import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_administracion/src/home/bloc/home_bloc.dart';
import 'package:proyecto_administracion/src/home/data/models/models.dart';

class SeguirComprando extends StatefulWidget {
  @override
  _SeguirComprando createState() => _SeguirComprando();
}

class _SeguirComprando extends State<SeguirComprando> {
  SaleModel model;
  @override
  void initState() {
    model = BlocProvider.of<HomeBloc>(context).saleModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color(0XFFf4f4f4),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: _productInfo(index),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: model.detail.length),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  Container(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "DIRECCION DE ENTREGA",
                          style:
                              TextStyle(fontSize: 25, color: Color(0xFF2b7a78)),
                        )),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 50,
                      ),
                      Expanded(
                        child: Text(
                          "X CALLE ZONA N CASA XX AVENIDA, MUNICIPIO",
                          style: TextStyle(fontSize: 22),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
                child: Column(
                  children: [
                    Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("TOTAL A PAGA:",
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFF2b7a78),
                              ))),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "PRODUCTOS ${model.detail.length}",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text("DELIVERY---------------------- Q TOTAL",
                              style: TextStyle(fontSize: 20)),
                          Text("TOTAL Q ${model.total}",
                              style: TextStyle(fontSize: 20))
                        ],
                      ),
                    )
                  ],
                )),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 50,
              child: RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CONFIRMAR MI ORDEN",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                color: Colors.green,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _productInfo(int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
              height: 40,
              width: double.infinity,
              child: Image.memory(model.detail[index].product.imagen)),
          Divider(
            color: Colors.black38,
          ),
          Container(
            height: 25,
            width: double.infinity,
            child: Text(
              "${model.detail[index].product.nombre}",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: double.infinity,
            child: Text(
              "Cantidad: ${model.detail[index].amount}",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            width: double.infinity,
            child: Text(
              "Precio: ${model.detail[index].product.precio}",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            width: double.infinity,
            child: Text(
              "Subtotal: ${model.detail[index].product.precio * model.detail[index].amount}",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                model.removeDetailSale(index, model.detail[index].product);
              });
            },
            child: Icon(Icons.remove_shopping_cart),
          )
        ],
      ),
    );
  }
}
