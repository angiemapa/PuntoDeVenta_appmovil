import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/clases/text_field_widget.dart';

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
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

  bool mostrar = true;
  void visible() {
    setState(() {
      mostrar = !mostrar;
    });
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenida a',
              style: TextStyle(
                color: Color(0xFF2b7a78),
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Image.asset(
              "assets/images/logo.png",
              width: 300,
              height: 300,
            ),
            SizedBox(
              height: 50,
            ),
            TextFielWidget(
              labelText: "Ingrese correo electronico",
              hinText: "Usuairo@correo.com",
              width: MediaQuery.of(context).size.width / 1.15,
            ),
            SizedBox(
              height: 20,
            ),
            TextFielWidget(
              labelText: "Ingrese contraseña",
              hinText: "***************",
              width: MediaQuery.of(context).size.width / 1.15,
              suffixIcon: IconButton(
                  icon: mostrar
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: visible),
              obscureText: mostrar == true ? mostrar : false,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 251,
              height: 50,
              child: RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ingresar",
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
            FlatButton(
              onPressed: () => Navigator.of(context).pushNamed("Login/email"),
              child: Text('Registrar usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
