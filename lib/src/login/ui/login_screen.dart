import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity, //ajuste a cualquier pantalla
            color: Color(0xFFfeffff),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                  ), //
                  Text(
                    'Bienvenida a',
                    style: TextStyle(
                      color: Color(0xFF2b7a78),
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ), //Espacio entre letra y logo
                  Image.asset(
                    "assets/images/logo.png",
                    width: 400,
                    height: 300,
                  ),
                  SizedBox(height: 70),
                  Container(
                    width: 251,
                    height: 50,
                    child: RaisedButton(
                      color: Color(0xFF17252A),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Google',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            'assets/images/ui.png',
                            width: 40,
                            height: 40,
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 251,
                    height: 50,
                    child: RaisedButton(
                      color: Color(0xFF17252A),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Google',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            'assets/images/facebook.png',
                            width: 40,
                            height: 40,
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed("Login/password"),
                    child: Text('Ingresar con correo electrónico'),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
