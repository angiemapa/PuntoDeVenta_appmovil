import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/clases/text_field_widget.dart';

class Emailscreen extends StatefulWidget {
  @override
  _EmailscreenState createState() => _EmailscreenState();
}

class _EmailscreenState extends State<Emailscreen> {
  @override
  bool mostrar = true;
  int valor = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, size: 35),
        title: Text(
          "Volver",
          style: TextStyle(color: Color(0xFF2b7a78)),
        ),
      ),
      body: SafeArea(child: _body(context)),
      backgroundColor: Colors.white,
    );
  }

  void mostrardatos() {
    setState(() {
      if (valor == 0) {
        valor++;
      } else {
        valor = 0;
      }
      mostrar = !mostrar;
    });
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text(
              'Crea tu cuenta UWU',
              style: TextStyle(fontSize: 30, color: Color(0xFF2b7a78)),
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text(
                "Nombre Completo",
                //textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
        SizedBox(
          height: 1,
        ),
        TextFielWidget(
          labelText: "Nombre y Apellido",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 18,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text(
                'Telefono',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "+502",
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextFielWidget(
              labelText: "Telefono",
              width: MediaQuery.of(context).size.width / 1.21,
              height: MediaQuery.of(context).size.height / 18,
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    'Dirección',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            TextFielWidget(
              labelText: "Dirección",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 18,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    'Correo Electrónico',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            TextFielWidget(
              labelText: "Correo electronico",
              hinText: "usuairo@corre.com",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 18,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    'Contraseña',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            Row(
              children: [
                TextFielWidget(
                  labelText: "Contraseña4",
                  hinText: "***************",
                  width: MediaQuery.of(context).size.width / 1.16,
                  height: MediaQuery.of(context).size.height / 18,
                  obscureText: valor == 0 ? mostrar : false,
                ),
                IconButton(
                  icon: mostrar
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: mostrardatos,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 251,
              height: 50,
              child: RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Crear Usuario",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                ),
                color: Color(0xFF17252A),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
