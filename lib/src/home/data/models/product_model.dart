part of 'models.dart';

class ProductModel {
  int count;
  String next;
  String previous;
  List<ProductResultModel> results;

  ProductModel({
    @required this.count,
    @required this.next,
    @required this.previous,
    @required this.results,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<ProductResultModel>();
      json['results'].forEach((v) {
        results.add(new ProductResultModel.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    return '(count: $count, next: $next, previous: $previous, results: [$results])';
  }
}
