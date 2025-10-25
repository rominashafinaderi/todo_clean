part of 'create_bloc.dart';

@immutable
abstract class CreateState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class CreateInitial extends CreateState {}

final class CreateLoading extends CreateState {}

final class CreateError extends CreateState {
  final String message;

  CreateError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class CreateSuccess extends CreateState {
  final TodoEntity todo;

  CreateSuccess({required this.todo});

  @override
  List<Object?> get props => [todo];
}
