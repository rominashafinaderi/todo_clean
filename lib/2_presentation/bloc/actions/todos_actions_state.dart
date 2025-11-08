part of 'todos_actions_bloc.dart';

@immutable
sealed class TodosActionsState {}

final class TodosActionsInitial extends TodosActionsState {}

final class TodosActionsLoading extends TodosActionsState {}

final class TodosActionsError extends TodosActionsState {
  final String message;

  TodosActionsError({required this.message});
}

final class TodosActionsSuccess extends TodosActionsState {
  final TodoEntity todo;

  TodosActionsSuccess({required this.todo});
}

final class TodosDeleteActionsSuccess extends TodosActionsState {}
