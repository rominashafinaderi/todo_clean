import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/0_data/models/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getTodosFromApi();

  Future<TodoModel> getTodosFromApiById(int id);

  Future<TodoModel> updateTodosFromApi(int id,int userId, String title, bool completed);

  Future<TodoModel> createTodosFromApi(int userId, String title, bool completed);

  Future<void> deleteTodosFromApi(int id);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  @override
  Future<List<TodoModel>> getTodosFromApi() async {
    final res = await http.get(Uri.parse(baseUrl), headers: {'Content-Type': 'application/json; charset=UTF-8'});
    if (res.statusCode != 200) {
      throw Exception();
    } else {
      final List<dynamic> data = json.decode(res.body);
      return data.map((e) => TodoModel.fromjson(e)).toList();
    }
  }

  @override
  Future<TodoModel> getTodosFromApiById(int id) async {
    final res = await http.get(Uri.parse('$baseUrl/$id'), headers: {'Content-Type': 'application/json; charset=UTF-8'});
    if (res.statusCode != 200) {
      throw Exception();
    } else {
      final resBody = json.decode(res.body);
      return TodoModel.fromjson(resBody);
    }
  }

  @override
  Future<TodoModel> createTodosFromApi(int userId, String title, bool completed) async {
    final res = await http.post(Uri.parse(baseUrl), headers: {'Content-Type': 'application/json; charset=UTF-8'}, body: jsonEncode({'userId': userId, 'title': title, 'completed': completed}));
    if (res.statusCode != 201) {
      throw Exception();
    } else {
      final resBody = json.decode(res.body);
      return TodoModel.fromjson(resBody);
    }
  }

  @override
  Future<TodoModel> updateTodosFromApi(int id,int userId, String title, bool completed) async {
    final res = await http.put(Uri.parse('$baseUrl/$id'), headers: {'Content-Type': 'application/json; charset=UTF-8'}, body: jsonEncode({'userIs':userId,'id': id, 'title': title, 'completed': completed}));
    if (res.statusCode != 200) {
      throw Exception();
    } else {
      final resBody = json.decode(res.body);
      return TodoModel.fromjson(resBody);
    }
  }

  @override
  Future<void> deleteTodosFromApi(int id) async {
    final res = await http.delete(Uri.parse('$baseUrl/$id'), headers: {'Content-Type': 'application/json; charset=UTF-8'});
    if (res.statusCode != 200) {
      throw Exception();
    }
  }
}
