part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadInitial extends HomeEvent {}

class LoadPagination extends HomeEvent {
  final bool isCategories;

  LoadPagination(
    this.isCategories,
  );
}
