import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:proyecto_administracion/src/home/data/models/models.dart';
import 'package:proyecto_administracion/src/home/data/repositories/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository prodRepo;
  final CategoryRepository catRepo;
  final CategoryModel catModel;
  final ProductModel prodModel;
  HomeBloc(
    this.prodRepo,
    this.catRepo,
    this.catModel,
    this.prodModel,
  ) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadInitial) {
      yield InProgress();
      final infoCat = await catRepo.getCategories();
      final infoProd = await prodRepo.getProducts();
      await Future.delayed(Duration(seconds: 1));
      if (infoCat["code"] == 200 && infoProd["code"] == 200) {
        final catModel = CategoryModel.fromJson(jsonDecode(infoCat["data"]));
        final prodModel = ProductModel.fromJson(jsonDecode(infoProd["data"]));
        this.catModel.count = catModel.count;
        this.catModel.next = catModel.next;
        this.catModel.previous = catModel.previous;
        this.catModel.results = catModel.results;
        this.prodModel.count = prodModel.count;
        this.prodModel.next = prodModel.next;
        this.prodModel.previous = prodModel.previous;
        this.prodModel.results = prodModel.results;
        yield SuccessData(this.catModel, this.prodModel);
      } else if (infoCat["code"] == 400) {
        yield Failure("Error al obtener los datos");
      } else {
        yield Failure("Error al obtener los datos");
      }
    } else if (event is LoadPagination) {
      yield InProgressPagination();
      if (event.isCategories) {
        final info =
            await catRepo.getCategoriesPagination(this.catModel.next ?? "");
        if (info["code"] == 200) {
          final catModel = CategoryModel.fromJson(jsonDecode(info["data"]));
          this.catModel.count += catModel.count;
          this.catModel.next = catModel.next;
          this.catModel.previous = catModel.previous;
          this.catModel.results = List.from(this.catModel.results)
            ..addAll(catModel.results);
          await Future.delayed(Duration(milliseconds: 100));
          yield SuccessPagination();
        } else {
          yield NoMoreData("No hay más Categorías para cargar");
        }
      } else {
        final info =
            await prodRepo.getProductsPagination(this.prodModel.next ?? "");
        if (info["code"] == 200) {
          final prodModel = ProductModel.fromJson(jsonDecode(info["data"]));
          this.prodModel.count += prodModel.count;
          this.prodModel.next = prodModel.next;
          this.prodModel.previous = prodModel.previous;
          this.prodModel.results = List.from(this.prodModel.results)
            ..addAll(prodModel.results);
          await Future.delayed(Duration(milliseconds: 100));
          yield SuccessPagination();
        } else {
          yield NoMoreData("No hay más productos para cargar");
        }
      }
    }
  }
}
