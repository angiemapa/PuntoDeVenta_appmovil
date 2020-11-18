import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/routes/app_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool estado;
  @override
  Widget build(BuildContext context) {
    generardatos();
    verificarusuaruio();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: (estado != false) ? "Login" : "Home",
      routes: getApplicationRoutes(),
    );
  }

  Future<void> verificarusuaruio() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    estado = prefs.getBool("estado");
    print('estado');
    print(estado);
    print(prefs.getInt("id"));
  }

  Future<void> generardatos() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("id", 0);
    prefs.setString("nombre", "");
    prefs.setBool("estado", false);
  }
}
