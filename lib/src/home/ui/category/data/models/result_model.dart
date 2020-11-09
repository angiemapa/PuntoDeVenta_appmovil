import 'package:flutter/foundation.dart';

class ResultModel {
  int id;
  String categoria;
  String imagen;

  ResultModel({
    @required this.id,
    @required this.categoria,
    @required this.imagen,
  });

  ResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoria = json['categoria'];
    imagen = json['imagen'];
  }

  @override
  String toString() => 'ResultModel(id: $id, categoria: $categoria, imagen: $imagen)';
}
