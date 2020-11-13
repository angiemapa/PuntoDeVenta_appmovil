part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class InProgress extends HomeState {}

class InProgressPagination extends HomeState {}

class SuccessData extends HomeState {
  final CategoryModel catModel;
  final ProductModel prodModel;
  SuccessData(
    this.catModel,
    this.prodModel,
  );
}

class SuccessPagination extends HomeState {}

class Failure extends HomeState {
  final String error;
  Failure(this.error);
}

class NoMoreData extends HomeState {
  final String error;
  NoMoreData(this.error);
}
