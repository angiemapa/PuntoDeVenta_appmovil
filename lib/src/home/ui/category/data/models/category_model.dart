import 'package:flutter/foundation.dart';

import 'package:proyecto_administracion/src/home/ui/category/data/models/result_model.dart';

class CategoryModel {
  int count;
  String next;
  String previous;
  List<ResultModel> results;

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
      results = new List<ResultModel>();
      json['results'].forEach((v) {
        results.add(new ResultModel.fromJson(v));
      });
    }
  }
  
  @override
  String toString() {
    return 'CategoryModel(count: $count, next: $next, previous: $previous, results: $results)';
  }
}
