import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/1_domain/entities/todo_entity.dart';
import 'package:todo_app/1_domain/repositories/todo_repo.dart';

part 'todos_actions_event.dart';

part 'todos_actions_state.dart';

class TodosActionsBloc extends Bloc<TodosActionsEvent, TodosActionsState> {
  final TodoRepository todoRepo;

  TodosActionsBloc({required this.todoRepo}) : super(TodosActionsInitial()) {
    on<CreateTodosActionEvent>(_onCreateTodo);
    on<UpdateTodosActionEvent>(_onUpdateTodo);
    on<DeleteTodosActionEvent>(_onDeleteTodo);
  }

  Future<void> _onCreateTodo(CreateTodosActionEvent event, Emitter<TodosActionsState> emit) async {
    emit(TodosActionsLoading());
    final result = await todoRepo.addTodo(event.todoEntity);
    result.fold((failure) => emit(TodosActionsError(message: 'failed to add the todo')), (todo) => emit(TodosActionsSuccess(todo: todo)));
  }

  Future<void> _onUpdateTodo(UpdateTodosActionEvent event, Emitter<TodosActionsState> emit) async {
    emit(TodosActionsLoading());
    final result = await todoRepo.updateTodo(event.todoEntity);
    result.fold((failure) => emit(TodosActionsError(message: 'failed to update the todo')), (todo) => emit(TodosActionsSuccess(todo: todo)));
  }

  Future<void> _onDeleteTodo(DeleteTodosActionEvent event, Emitter<TodosActionsState> emit) async {
    emit(TodosActionsLoading());
    final result = await todoRepo.deleteTodo(event.id);
    result.fold((failure) => emit(TodosActionsError(message: 'failed to delete the todo')), (_) => emit(TodosDeleteActionsSuccess()));
  }
}
