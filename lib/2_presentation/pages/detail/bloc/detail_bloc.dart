import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/1_domain/entities/todo_entity.dart';
import 'package:todo_app/1_domain/repositories/todo_repo.dart';

part 'detail_event.dart';

part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final TodoRepo todoRepo;

  DetailBloc({required this.todoRepo}) : super(DetailInitial()) {
    on<DetailEvent>(_onDetailTodo);
  }

  FutureOr<void> _onDetailTodo(DetailEvent event, Emitter<DetailState> emit) async {
    emit(DetailLoading());
    final result = await todoRepo.getTodosById(event.id);
    result.fold((failure) => emit(DetailError(message: 'failed to get the todo')), (todo) => emit(DetailSuccess(todo: todo)));
  }
}
