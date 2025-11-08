import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/1_domain/entities/todo_entity.dart';
import 'package:todo_app/1_domain/repositories/todo_repo.dart';

part 'get_all_event.dart';

part 'get_all_state.dart';

class GetAllBloc extends Bloc<GetAllEvent, GetAllState> {
  final TodoRepository todoRepo;

  GetAllBloc({required this.todoRepo}) : super(GetAllInitial()) {
    on<GetAllEvent>(_onHomeEvent);
  }

  Future<void> _onHomeEvent(GetAllEvent event, Emitter<GetAllState> emit) async {
    emit(GetAllLoading());
    final result = await todoRepo.getAll();
    result.fold((failure) => emit(GetAllError(message: 'failed to get the todos')), (todos) => emit(GetAllSuccess(todos: todos)));
  }
}
