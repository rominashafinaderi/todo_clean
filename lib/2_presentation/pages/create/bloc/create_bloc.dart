import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/1_domain/entities/todo_entity.dart';
import 'package:todo_app/1_domain/usecases/todo_usecase.dart';

part 'create_event.dart';

part 'create_state.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  final TodoUseCase todoUseCase;

  CreateBloc({required this.todoUseCase}) : super(CreateInitial()) {
    on<CreateEvent>(_onCreateTodo);
  }

  Future<void> _onCreateTodo(CreateEvent event, Emitter<CreateState> emit) async {
    emit(CreateLoading());
    final result = await todoUseCase.createTodosFromRepo(event.userId, event.title, event.completed);
    result.fold((failure) => emit(CreateError(message: 'failed to add the todo')), (todo) => emit(CreateSuccess(todo: todo)));
  }
}
