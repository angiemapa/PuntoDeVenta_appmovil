import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_administracion/login/login_screen3.dart';
import 'package:proyecto_administracion/src/home/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Usuario_final {
  final urlBase = "ec2-54-214-157-22.us-west-2.compute.amazonaws.com";
  //Login_UP logiando = Login_UP();
  List<UsuarioGet> usuario1;
  String valor = "";

  Future<bool> getUsuario(User usuario, UsuarioGet cliente, bool valor) async {
    print('correo2 =' + usuario.email);
    UsuarioGet usuarioretornado = UsuarioGet();
    final urlgetusuarios = Uri.http(urlBase, '/api/v1.0/usuarios');
    final respuesta = await http.get(urlgetusuarios);
    final data = json.decode(respuesta.body);
    print(data);
    final descodedData = jsonDecode(respuesta.body);
    if (descodedData == null) return null;
    final usuarioAPI = descodedData['results'];
    usuario1 = new List();
    for (var item in usuarioAPI) {
      final usuarioTemp = new UsuarioGet.fromJson(item);
      usuarioretornado = usuarioTemp;
      usuario1.add(usuarioretornado);
      if (usuarioretornado.correo == usuario.email) {
        //solo obtenemos el valor del id del usuario
        print(usuario.email + " == " + usuarioretornado.correo);
        generardatos(usuarioretornado);
        //Navigator.of(context).popAndPushNamed("Home");
        return true;
      }
    }
    if (valor) {
      postUsuario(usuario, cliente, valor);
      getUsuario(usuario, cliente, valor);
    } else {
      agregarcliente(cliente);
      getUsuario(usuario, cliente, valor);
    }
    //agregamos al nuevo usuario
    return true;
  }

  Future<bool> postUsuario(User usuario, UsuarioGet cliente, bool valor) async {
    String idtoken;
    usuario.getIdToken().then((value) {
      idtoken = value;
    });
    print("token evaluar" + idtoken);
    final UsuarioPost nuevousuario = new UsuarioPost(
        nombre: usuario.displayName,
        correo: usuario.email,
        telefono: (usuario.phoneNumber != null) ? usuario.phoneNumber : "0",
        token: (idtoken != null) ? idtoken : 0,
        contrasena: "0");
    print(usuarioModelJson(nuevousuario));
    final urlpostusuarios = Uri.http(urlBase, '/api/v1.0/usuarios');
    final respuesta = await http
        .post(urlpostusuarios, body: usuarioModelJson(nuevousuario), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    final decodeData = jsonDecode(respuesta.body);
    if (decodeData['status']) {
      print(decodeData);
      return true;
    } else {
      print(decodeData);
      return false;
    }
  }

  Future agregarcliente(UsuarioGet usuario) async {
    final UsuarioPost nuevousuario = new UsuarioPost(
        nombre: usuario.nombre,
        correo: usuario.correo,
        telefono: (usuario.telefono != null) ? usuario.telefono : "0",
        contrasena: usuario.contrasena);
    print(usuarioModelJson(nuevousuario));
    final urlpostusuarios = Uri.http(urlBase, '/api/v1.0/usuarios');
    final respuesta = await http
        .post(urlpostusuarios, body: usuarioModelJson(nuevousuario), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    final decodeData = jsonDecode(respuesta.body);
    if (decodeData['status']) {
      print(decodeData);
      return true;
    } else {
      print(decodeData);
      return false;
    }
  }

  Future<void> generardatos(UsuarioGet usuario) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setInt("id", usuario.id);
    prefs.setString("nombre", usuario.nombre);
    prefs.setBool("estado", true);
  }
}
