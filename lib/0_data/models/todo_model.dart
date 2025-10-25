  import 'package:equatable/equatable.dart';
  import 'package:todo_app/1_domain/entities/todo_entity.dart';

  class TodoModel extends TodoEntity {
    TodoModel({required int id, required String title, required bool completed, required int userId}) : super(id: id, title: title, completed: completed, userId: userId);

    factory TodoModel.fromjson(Map<String, dynamic> json) {
      return TodoModel(id: json['id'], title: json['title'], completed: json['completed'], userId: json['userId']);
    }

    Map<String, dynamic> toJson() => {'id': id, 'userId': userId, 'title': title, 'completed': completed};

    @override
    List<Object?> get props => [id, title, completed, userId];
  }
