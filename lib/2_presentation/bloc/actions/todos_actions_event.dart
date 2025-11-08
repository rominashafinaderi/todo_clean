part of 'todos_actions_bloc.dart';

abstract class TodosActionsEvent {}

class DeleteTodosActionEvent extends TodosActionsEvent {
  final int id;

  DeleteTodosActionEvent({required this.id});
}

class CreateTodosActionEvent extends TodosActionsEvent {
  final TodoEntity todoEntity;

  CreateTodosActionEvent({required this.todoEntity});
}

class UpdateTodosActionEvent extends TodosActionsEvent {
  final TodoEntity todoEntity;

  UpdateTodosActionEvent({required this.todoEntity});
}
