import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/1_domain/repositories/todo_repo.dart';

part 'delete_event.dart';

part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  final TodoRepo todoRepo;

  DeleteBloc({required this.todoRepo}) : super(DeleteInitial()) {
    on<DeleteEvent>(_onDeleteTodo);
  }

  Future<void> _onDeleteTodo(DeleteEvent event, Emitter<DeleteState> emit) async {
    emit(DeleteLoading());
    final result = await todoRepo.deleteTodosList(event.id);
    result.fold((failure) => emit(DeleteError()), (_) => emit(DeleteSuccess()));
  }
}
