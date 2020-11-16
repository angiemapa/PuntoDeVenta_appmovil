part of 'models.dart';

class ProductResultModel {
  int id;
  String nombre;
  double precio;
  String descripcion;
  bool disponibilidad;
  int tipoProducto;
  int proveedor;
  Uint8List imagen;

  ProductResultModel({
    this.id,
    this.nombre,
    this.precio,
    this.descripcion,
    this.disponibilidad,
    this.tipoProducto,
    this.proveedor,
    this.imagen,
  });

  ProductResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    precio = double.parse(json['precio']);
    descripcion = json['descripcion'];
    disponibilidad = json['disponibilidad'];
    tipoProducto = json['tipo_producto'];
    proveedor = json['proveedor'];
    imagen = _getUint8List(json['imagen']);
  }

  @override
  String toString() {
    return '(id: $id, nombre: $nombre, precio: $precio, descripcion: $descripcion, disponibilidad: $disponibilidad, tipoProducto: $tipoProducto, proveedor: $proveedor, imagen: $imagen)';
  }

  Uint8List _getUint8List(json) {
    final data = json.split(";");
    data[1] = data[1].substring(7, data[1].length);
    return Base64Decoder().convert(data[1]);
  }
}
