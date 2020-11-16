import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Correo extends StatefulWidget {
  @override
  _CorreoState createState() => _CorreoState();
}

class _CorreoState extends State<Correo> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registrate por correo",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 360,
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Por favor escriba un correo';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Correo',
                ),
                controller: emailTextController,
              ),
            ),
            SizedBox(
              width: 360,
              child: TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Por favor escriba una contraseña';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
                controller: passwordTextController,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 360,
              child: RaisedButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.mail, size: 30),
                    Text(
                      '  Ingresa con correo',
                      style: TextStyle(fontSize: 28),
                    )
                  ],
                ),
                textColor: Colors.white,
                color: Colors.red[400],
                padding: EdgeInsets.all(10),
                onPressed: () {
                  singUpWithMail();
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 360,
              child: RaisedButton(
                onPressed: () {
                  singUpWithFacebook();
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.thumb_up, size: 30),
                    Text(
                      '  Ingresa con Facebook',
                      style: TextStyle(fontSize: 26),
                    )
                  ],
                ),
                textColor: Colors.white,
                color: Colors.red[400],
                padding: EdgeInsets.all(10),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 360,
              child: RaisedButton(
                onPressed: () {
                  singUpWithGoogle();
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.toys, size: 30),
                    Text(
                      '  Ingresa con Google',
                      style: TextStyle(fontSize: 28),
                    )
                  ],
                ),
                textColor: Colors.white,
                color: Colors.red[400],
                padding: EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> singUpWithMail() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);
      showDialog(
          context: this.context,
          builder: (context) {
            return AlertDialog(
              content: Text('Ingreso completado'),
            );
          });
    } catch (e) {
      print(e.message);
      showDialog(
          context: this.context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          });
    }
  }

  Future<void> singUpWithFacebook() async {
    try {
      var facebookLogin = new FacebookLogin();
      var result = await facebookLogin.logIn(['email']);
      AuthCredential credential;
      if (result.status == FacebookLoginStatus.loggedIn) {
        credential = FacebookAuthProvider.credential(result.accessToken.token);
      }
      ;
      final User user =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      print(user.displayName);
      return user;
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> singUpWithGoogle() async {
    try {
      GoogleSignIn _googleSignIn =
          GoogleSignIn(scopes: ['email'], hostedDomain: "", clientId: "");
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googlrAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googlrAuth.accessToken, idToken: googlrAuth.idToken);
      final User user = (await _auth.signInWithCredential(credential)).user;
      print("Sign in " + user.displayName);
      return user;
    } catch (e) {
      print(e.message);
    }
  }

  /*Future<void> _logOutGoogle() => _googleSignIn.disconnect();

  Future<Null> _logOutFacebook() async {
    await facebookLogin.logOut();
  }

  Future<Null> _logOutCorreo() async {
    await FirebaseAuth.instance.signOut();
  }*/
}
