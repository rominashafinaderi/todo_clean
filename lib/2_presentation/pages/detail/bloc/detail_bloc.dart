import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/1_domain/entities/todo_entity.dart';
import 'package:todo_app/1_domain/usecases/todo_usecase.dart';

part 'detail_event.dart';

part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final TodoUseCase todoUseCase;

  DetailBloc({required this.todoUseCase}) : super(DetailInitial()) {
    on<DetailEvent>(_onDetailTodo);
  }

  FutureOr<void> _onDetailTodo(DetailEvent event, Emitter<DetailState> emit) async {
    emit(DetailLoading());
    final result = await todoUseCase.getTodosByIdFromRepo(event.id);
    result.fold((failure) => emit(DetailError(message: 'failed to get the todo')), (todo) => emit(DetailSuccess(todo: todo)));
  }
}
