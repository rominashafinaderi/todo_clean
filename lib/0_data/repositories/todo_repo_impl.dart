import 'package:dartz/dartz.dart';
import 'package:todo_app/0_data/datasources/Remote/todo_remote_datasource.dart';
import 'package:todo_app/1_domain/entities/todo_entity.dart';
import 'package:todo_app/1_domain/failure/failure.dart';
import 'package:todo_app/1_domain/repositories/todo_repo.dart';

class TodoRepoImpl implements TodoRepo {
  final TodoRemoteDataSource todoRemoteDataSource;

  TodoRepoImpl({required this.todoRemoteDataSource});

  @override
  Future<Either<Failure, List<TodoEntity>>> getTodosList() async {
    try {
      final result = await todoRemoteDataSource.getTodosFromApi();
      return right(result);
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> getTodosById(int id) async {
    try {
      final result = await todoRemoteDataSource.getTodosFromApiById(id);
      return right(result);
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> createTodosList(int userId, String title, bool completed) async {
    try {
      final result = await todoRemoteDataSource.createTodosFromApi(userId, title, completed);
      return right(result);
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> updateTodosList(int id,int userId, String title, bool completed) async {
    try {
      final result = await todoRemoteDataSource.updateTodosFromApi(id,userId, title, completed);
      return right(result);
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTodosList(int id) async {
    try {
      await todoRemoteDataSource.deleteTodosFromApi(id);
      return right(unit);
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
