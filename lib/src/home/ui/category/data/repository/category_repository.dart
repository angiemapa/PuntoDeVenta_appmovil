import 'package:http/http.dart' as http;

class CategoryRepository {
  String urlBase =
      "http://ec2-54-214-157-22.us-west-2.compute.amazonaws.com/api/v1.0";

  Future<Map<String, dynamic>> getCategories() async {
    final response = await http.get(
      "$urlBase/tipodeproducto/",
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json; charset=utf-8',
      },
    );
    return {
      "code": response.statusCode,
      "data": response.body,
    };
  }
}
