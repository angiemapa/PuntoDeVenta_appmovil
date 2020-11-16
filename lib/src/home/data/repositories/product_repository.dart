part of 'repository.dart';

class ProductRepository {
  String urlBase =
      "http://ec2-54-214-157-22.us-west-2.compute.amazonaws.com/api/v1.0";

  Future<Map<String, dynamic>> getProducts() async {
    String message = "";
    try {
      final response = await http.get(
        "$urlBase/producto/",
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": 'application/json; charset=UTF-8',
        },
      );
      return {
        "code": response.statusCode,
        "data": utf8.decode(response.bodyBytes),
      };
    } on SocketException {
      message = "No Internet connection";
    } on HttpException {
      message = "No se pudo encontrar la lista";
    }
    return {
      "code": 0,
      "data": message,
    };
  }

  Future<Map<String, dynamic>> getProductsPagination(String url) async {
    if (url == "") return {"code": 0, "data": "No hay más datos"};
    String message = "";
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-type': 'application/json; charset=utf-8',
          'Accept': 'application/json; charset=utf-8',
        },
      );
      return {
        "code": response.statusCode,
        "data": utf8.decode(response.bodyBytes),
      };
    } on SocketException {
      message = "No Internet connection";
    } on HttpException {
      message = "No se pudo encontrar la lista";
    }
    return {
      "code": 0,
      "data": message,
    };
  }
}
