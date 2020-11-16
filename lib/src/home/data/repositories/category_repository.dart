part of 'repository.dart';

class CategoryRepository {
  String urlBase =
      "http://ec2-54-214-157-22.us-west-2.compute.amazonaws.com/api/v1.0";

  Future<Map<String, dynamic>> getCategories() async {
    String message = "";
    try {
      final response = await http.get(
        "$urlBase/tipodeproducto/",
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Accept': 'application/json; charset=utf-8',
        },
      );
      return {
        "code": response.statusCode,
        "data": utf8.decode(response.bodyBytes),
      };
    } on SocketException {
      message = "No Internet connection";
    }
    return {
      "code": 0,
      "data": message,
    };
  }

  Future<Map<String, dynamic>> getCategoriesPagination(String url) async {
    String message = "";
    if(url=="") return {"code":0,"data": "No hay más datos"};
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Accept': 'application/json; charset=utf-8',
        },
      );
      return {
        "code": response.statusCode,
        "data": utf8.decode(response.bodyBytes),
      };
    } on SocketException {
      message = "No Internet connection";
    }
    return {
      "code": 0,
      "data": message,
    };
  }
}
