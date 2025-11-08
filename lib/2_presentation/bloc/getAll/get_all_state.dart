part of 'get_all_bloc.dart';

@immutable
sealed class GetAllState {}

final class GetAllInitial extends GetAllState {}

final class GetAllLoading extends GetAllState {}

final class GetAllError extends GetAllState {
  final String message;

  GetAllError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class GetAllSuccess extends GetAllState {
  final List<TodoEntity> todos;

  GetAllSuccess({required this.todos});

  @override
  List<Object?> get props => [todos];
}
