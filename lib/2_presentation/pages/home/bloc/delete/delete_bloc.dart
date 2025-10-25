import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/1_domain/usecases/todo_usecase.dart';

part 'delete_event.dart';

part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  final TodoUseCase todoUseCase;

  DeleteBloc({required this.todoUseCase}) : super(DeleteInitial()) {
    on<DeleteEvent>(_onDeleteTodo);
  }

  Future<void> _onDeleteTodo(DeleteEvent event, Emitter<DeleteState> emit) async {
    emit(DeleteLoading());
    final result = await todoUseCase.deleteTodosFromRepo(event.id);
    result.fold((failure) => emit(DeleteError()), (_) => emit(DeleteSuccess()));
  }
}
