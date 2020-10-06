import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/login/ui/login_screen.dart';
import 'package:proyecto_administracion/src/login/ui/product_list_screen.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "Login": (BuildContext context) => LoginScreen(),
    "Producto/list": (BuildContext context) => ListaScreen()
  };
}