import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/2_presentation/pages/detail/bloc/detail_bloc.dart';
import 'package:todo_app/1_domain/entities/todo_entity.dart';

class TodoDetailScreen extends StatelessWidget {
  final int todoId;

  const TodoDetailScreen({super.key, required this.todoId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        if (state is DetailLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is DetailSuccess) {
          final TodoEntity todo = state.todo;
          return Scaffold(
            appBar: AppBar(title: const Text('جزئیات تسک')),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('عنوان:', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(todo.title, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 16),
                  Text('وضعیت: ${todo.completed ? 'انجام شده' : 'انجام نشده'}'),
                  const SizedBox(height: 8),
                  Text('id: ${todo.id}'),
                  const SizedBox(height: 8),
                  Text('userId: ${todo.userId}'),
                ],
              ),
            ),
          );
        } else if (state is DetailError) {
          return Scaffold(
            body: Center(child: Text('خطا: ${state.message}')),
          );
        }
        return const Scaffold(
          body: Center(child: Text('در حال آماده‌سازی...')),
        );
      },
    );
  }
}
