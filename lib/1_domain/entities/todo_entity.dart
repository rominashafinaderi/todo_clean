import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoEntity({required this.id, required this.title, required this.completed, required this.userId});

  @override
  List<Object?> get props => [id, title, completed, userId];
  TodoEntity copyWith({
    int? id,
    int? userId,
    String? title,
    bool? completed,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
