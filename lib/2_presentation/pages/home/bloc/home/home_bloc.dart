import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/1_domain/entities/todo_entity.dart';
import 'package:todo_app/1_domain/repositories/todo_repo.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TodoRepo todoRepo;

  HomeBloc({required this.todoRepo}) : super(HomeInitial()) {
    on<HomeEvent>(_onHomeEvent);
  }

  Future<void> _onHomeEvent(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    final result = await todoRepo.getTodosList();
    result.fold((failure) => emit(HomeError(message: 'failed to get the todos')), (todos) => emit(HomeSuccess(todos: todos)));
  }
}
