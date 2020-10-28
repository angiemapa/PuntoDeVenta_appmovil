import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/login/ui/buy_list_screen.dart';
import 'package:proyecto_administracion/src/routes/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BuyList(),
      /*debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "Login",
      routes: getApplicationRoutes(),*/
    );
  }
}
