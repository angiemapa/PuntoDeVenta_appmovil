import 'package:flutter/material.dart';

class SeguirComprando extends StatefulWidget {
  @override
  _SeguirComprando createState() => _SeguirComprando();
}

class _SeguirComprando extends State<SeguirComprando> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {},
          ),
          title: Text(("Seguir Comprando"),
              style: TextStyle(color: Color(0xFF2b7a78), fontSize: 25)),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 1,
                    ),
                    Text(
                      "ORDEN",
                      style: TextStyle(color: Color(0xFF2b7a78), fontSize: 25),
                    ),
                    Padding(padding: EdgeInsets.only(left: 15))
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Column(
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ButtonBar(children: [
                                  Text(
                                    "^",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ]),
                                Container(
                                  child: Text("X1",
                                      style: TextStyle(fontSize: 20)),
                                ),
                                ButtonBar(
                                  children: [
                                    Text(
                                      "v",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "NOMBRE PRODUCTO",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Q sub.00", style: TextStyle(fontSize: 20))
                          ],
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ButtonBar(children: [
                                  Text(
                                    "^",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ]),
                                Container(
                                  child: Text("X1",
                                      style: TextStyle(fontSize: 20)),
                                ),
                                ButtonBar(
                                  children: [
                                    Text(
                                      "v",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text("NOMBRE PRODUCTO",
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Q sub.00", style: TextStyle(fontSize: 20))
                          ],
                        )
                      ],
                    )),
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
                              style: TextStyle(
                                  fontSize: 25, color: Color(0xFF2b7a78)),
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
                                "PRODUCTOS--------------------- Q TOTAL",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text("DELIVERY---------------------- Q TOTAL",
                                  style: TextStyle(fontSize: 20)),
                              Text("TOTAL--------------------------- Q TOTAL",
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
        ));
  }
}
