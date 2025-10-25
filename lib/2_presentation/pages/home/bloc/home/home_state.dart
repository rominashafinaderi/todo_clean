part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class HomeSuccess extends HomeState {
  final List<TodoEntity> todos;

  HomeSuccess({required this.todos});

  @override
  List<Object?> get props => [todos];
}
