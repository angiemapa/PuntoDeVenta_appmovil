import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proyecto_administracion/src/user/ui/user_datos.dart';

class Correo {
  /*Future<void> singUpWithMail() async {
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
        },
      );
    }
  }*/

  Future<void> singUpWithFacebook() async {
    Usuario_final cliente = Usuario_final();
    try {
      var facebookLogin = new FacebookLogin();
      var result = await facebookLogin.logIn(['email']);
      AuthCredential credential;
      if (result.status == FacebookLoginStatus.loggedIn) {
        credential = FacebookAuthProvider.credential(result.accessToken.token);
        final User user =
            (await FirebaseAuth.instance.signInWithCredential(credential)).user;
        cliente.getUsuario(user, null, true);
        return user;
      }
      return null;
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> singUpWithGoogle() async {
    Usuario_final cliente = Usuario_final();
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
      cliente.getUsuario(user, null, true);
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
