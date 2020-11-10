import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:proyecto_administracion/src/home/ui/category/data/models/category_model.dart';
import 'package:proyecto_administracion/src/home/ui/category/data/repository/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;
  CategoryModel model;
  CategoryBloc({
    @required this.repository,
    @required this.model,
  }) : super(Initial());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is LoadInitialCategory) {
      yield InProgress();
      final info = await repository.getCategories();
      await Future.delayed(Duration(seconds: 1));
      switch (info["code"]) {
        case 200:
          this.model = CategoryModel.fromJson(jsonDecode(info["data"]));
          yield Success(model);
          break;
        default:
          yield Failure("Error al obtener las categorías");
      }
    }
  }
}
