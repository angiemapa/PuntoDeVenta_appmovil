import 'package:flutter/material.dart';
import 'package:proyecto_administracion/login/login_screen3.dart';
import 'package:proyecto_administracion/src/home/data/repositories/email_repository.dart';

class LoginScreen extends StatelessWidget {
  EmailRepository er = EmailRepository();
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
                      //Boton para iniciar cuenta con google
                      color: Color(0xFF17252A),
                      onPressed: () {
                        Correo cliente = Correo();
                        cliente.singUpWithGoogle();
                        Navigator.of(context).popAndPushNamed("Home");
                      },

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
                      onPressed: () {
                        //botton para ingresar con usuario de facebook
                        Correo cliente = Correo();
                        cliente.singUpWithFacebook();
                        Navigator.of(context).pushNamed("List/Screen");
                        er.cargarUsuarios();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Facebook',
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
                        Navigator.of(context).pushNamed("EmailScreen2"),
                    child: Text('Ingresar con correo electrónico'),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
