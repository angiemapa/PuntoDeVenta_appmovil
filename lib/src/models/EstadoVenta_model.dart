
import 'dart:convert';

EstadoVentas estadoVentasFromJson(String str) => EstadoVentas.fromJson(json.decode(str));

String estadoVentasToJson(EstadoVentas data) => json.encode(data.toJson());

class EstadoVentas {
    EstadoVentas({
        this.id,
        this.estado,
    });

    int id;
    String estado;

    factory EstadoVentas.fromJson(Map<String, dynamic> json) => EstadoVentas(
        id: json["id"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "estado": estado,
    };
}