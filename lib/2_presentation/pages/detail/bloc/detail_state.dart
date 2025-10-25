part of 'detail_bloc.dart';

@immutable
abstract class DetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class DetailInitial extends DetailState {}

final class DetailLoading extends DetailState {}

final class DetailError extends DetailState {
  final String message;

  DetailError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class DetailSuccess extends DetailState {
  final TodoEntity todo;

  DetailSuccess({required this.todo});

  @override
  List<Object?> get props => [todo];
}
