import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/login/ui/buy_list_screen.dart';
import 'package:proyecto_administracion/src/login/ui/emailpass_screen.dart';
import 'package:proyecto_administracion/src/login/ui/list_screen.dart';
import 'package:proyecto_administracion/src/login/ui/login_screen.dart';
import 'package:proyecto_administracion/src/login/ui/email_screen.dart';
import 'package:proyecto_administracion/src/login/ui/seguircomprando_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "Login": (BuildContext context) => LoginScreen(),
    "Login/email": (BuildContext context) => Emailscreen(),
    "Login/password": (BuildContext context) => PasswordScreen(),
    "List/screen": (BuildContext context) => List(),
    "Seguir/screen": (BuildContext context) => SeguirComprando(),
    "Usuario/screen": (BuildContext context) => BuyList()
  };
}
