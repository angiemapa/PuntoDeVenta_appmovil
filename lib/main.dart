import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/login/home.dart';
import 'package:proyecto_administracion/src/login/ui/EstadoVenta.dart';
import 'package:proyecto_administracion/src/routes/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "homes",
      //routes: getApplicationRoutes(),
      routes: {
        "Estado/Venta": (BuildContext context) => EstadoVentas(),
        "homes":(BuildContext context) => homes(),
      },
      
    );
  }
}
