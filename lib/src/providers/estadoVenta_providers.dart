import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyecto_administracion/src/models/EstadoVenta_model.dart';

class estadoVentaPro {
  final url = 'ec2-54-214-157-22.us-west-2.compute.amazonaws.com';
  cargarEstado(int id) async {
    final url1 = Uri.http(url, '/api/v1.0/venta/estado/${id.toString()}');
    print(url1);
    final resp = await http.get(url1);
    final codyng = json.decode(resp.body);
    EstadoVentas estado = new EstadoVentas.fromJson(codyng);
    return estado.estado;
  }

  delete(int id) async {
    final url2 = Uri.http(url, '/api/v1.0/venta/${id.toString()}');
    final resp = await http.delete(url2);
    print("venta Cancelada");
  }
}
