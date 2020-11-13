part of 'models.dart';

class CategoryResultModel {
  int id;
  String categoria;
  String imagen;

  CategoryResultModel({
    @required this.id,
    @required this.categoria,
    @required this.imagen,
  });

  CategoryResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoria = json['categoria'];
    imagen = json['imagen'];
  }

  @override
  String toString() => '(id: $id, categoria: $categoria, imagen: $imagen)';
}
