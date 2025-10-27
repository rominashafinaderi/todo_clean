import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/1_domain/entities/todo_entity.dart';
import 'package:todo_app/1_domain/repositories/todo_repo.dart';

part 'edit_event.dart';

part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  final TodoRepo todoRepo;

  EditBloc({required this.todoRepo}) : super(EditInitial()) {
    on<EditEvent>(_onEditTodo);
  }

  Future<void> _onEditTodo(EditEvent event, Emitter<EditState> emit) async {
    emit(EditLoading());
    final result = await todoRepo.updateTodosList(event.todo.id, event.todo.userId, event.todo.title, event.todo.completed);
    result.fold((failure) => emit(EditError(message: 'failed to edit the todo')), (todo) => emit(EditSuccess(todo: todo)));
  }
}
