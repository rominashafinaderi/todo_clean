part of 'edit_bloc.dart';

@immutable
abstract class EditState extends Equatable {
  const EditState();

  @override
  List<Object?> get props => [];
}

class EditInitial extends EditState {}

class EditLoading extends EditState {}

class EditSuccess extends EditState {
  final TodoEntity todo;

  const EditSuccess({required this.todo});

  @override
  List<Object?> get props => [todo];
}

class EditError extends EditState {
  final String message;

  const EditError({required this.message});

  @override
  List<Object?> get props => [message];
}