part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class Initial extends CategoryState {}

class InProgress extends CategoryState {}

class Success extends CategoryState {
  final CategoryModel model;
  Success(this.model);
}

class Failure extends CategoryState {
  final String error;
  Failure(this.error);

}
