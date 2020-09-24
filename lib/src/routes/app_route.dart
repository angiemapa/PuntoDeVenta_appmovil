import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/login/ui/emailpass_screen.dart';
import 'package:proyecto_administracion/src/login/ui/login_screen.dart';
import 'package:proyecto_administracion/src/login/ui/email_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "Login": (BuildContext context) => LoginScreen(),
    "Login/email": (BuildContext context) => EmailScreen(),
    "Login/password": (BuildContext context) => PasswordScreen()
  };
}
