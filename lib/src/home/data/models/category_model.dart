part of 'models.dart';

class CategoryModel {
  int count;
  String next;
  String previous;
  List<CategoryResultModel> results;

  CategoryModel({
    @required this.count,
    @required this.next,
    @required this.previous,
    @required this.results,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<CategoryResultModel>();
      json['results'].forEach((v) {
        results.add(new CategoryResultModel.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    return '(count: $count, next: $next, previous: $previous, results: [$results])';
  }
}
