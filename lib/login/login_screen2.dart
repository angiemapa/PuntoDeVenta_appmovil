import 'dart:convert';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => new _Login2State();
}

class _Login2State extends State<Login2> {
  bool isLoggedIn = false;

  void initiateFacebookLogin() async {
    var login = FacebookLogin();
    var result = await login.logIn(['email', 'user_link']);
    switch (result.status) {
      case FacebookLoginStatus.error:
        print("Surgio un error");
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("Cancelado por el usuario");
        break;
      case FacebookLoginStatus.loggedIn:
        onLoginStatusChange(true);
        getUserInfo(result);
        break;
    }
  }

  void getUserInfo(FacebookLoginResult result) async {
    final token = result.accessToken.token;
    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
    final profile = json.decode(graphResponse.body);
    print(profile['user_link']);
  }

  void onLoginStatusChange(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Login with facebook'),
        ),
        body: new Center(
          child: isLoggedIn
              ? Text("Bienvenido")
              : new RaisedButton(
                  onPressed: () => initiateFacebookLogin(),
                  child: new Text('Iniciar sesion con Facebook'),
                ),
        ),
      ),
    );
  }
}
