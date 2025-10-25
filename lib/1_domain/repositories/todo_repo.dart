import 'package:todo_app/1_domain/entities/todo_entity.dart';
import 'package:todo_app/1_domain/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepo {
  Future<Either<Failure, List<TodoEntity>>> getTodosList();

  Future<Either<Failure, TodoEntity>> getTodosById(int id);

  Future<Either<Failure, TodoEntity>> createTodosList(int userId, String title, bool completed);

  Future<Either<Failure, TodoEntity>> updateTodosList(int id,int userId, String title, bool completed);

  Future<Either<Failure, Unit>> deleteTodosList(int id);
}
