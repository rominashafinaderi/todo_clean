import 'package:dartz/dartz.dart';
import 'package:todo_app/1_domain/entities/todo_entity.dart';
import 'package:todo_app/1_domain/failure/failure.dart';
import 'package:todo_app/1_domain/repositories/todo_repo.dart';

class TodoUseCase {
  final TodoRepo todoRepo;

  TodoUseCase({required this.todoRepo});

  Future<Either<Failure, List<TodoEntity>>> getTodosFromRepo() {
    return todoRepo.getTodosList();
  }

  Future<Either<Failure, TodoEntity>> getTodosByIdFromRepo(int id) {
    return todoRepo.getTodosById(id);
  }

  Future<Either<Failure, TodoEntity>> createTodosFromRepo(int userId, String title, bool completed) {
    return todoRepo.createTodosList(userId, title, completed);
  }

  Future<Either<Failure, TodoEntity>> updateTodosFromRepo(int id, int userId, String title, bool completed) {
    return todoRepo.updateTodosList(id, userId, title, completed);
  }

  Future<Either<Failure, Unit>> deleteTodosFromRepo(int id) {
    return todoRepo.deleteTodosList(id);
  }
}
