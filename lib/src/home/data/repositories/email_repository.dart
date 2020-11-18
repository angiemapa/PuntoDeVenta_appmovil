import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyecto_administracion/src/home/data/models/user_model.dart';

class EmailRepository {
  final urlApi = 'ec2-54-214-157-22.us-west-2.compute.amazonaws.com';
  Future<UsuarioGet> cargarUsuario() async {
    int id = 1;
    final url = Uri.http(urlApi, '/api/v1.0/usuarios/$id');
    final response = await http.get(url);
    final decodeData = jsonDecode(response.body);
    if (decodeData == null) return null;
    final usuario = decodeData;
    UsuarioGet user = new UsuarioGet.fromJson(usuario);
    return user;
  }

  Future<List<UsuarioGet>> cargarUsuarios() async {
    final url = Uri.http(urlApi, '/api/v1.0/usuarios/');
    final response = await http.get(url);
    final decodeData = jsonDecode(response.body);
    if (decodeData == null) return null;
    final usuario = decodeData['results'];
    List<UsuarioGet> usuarios = new List();
    for (var item in usuario) {
      final usuarioTemp = new UsuarioGet.fromJson(item);
      usuarios.add(usuarioTemp);
    }
    print(usuario);
    return usuarios;
  }
}
