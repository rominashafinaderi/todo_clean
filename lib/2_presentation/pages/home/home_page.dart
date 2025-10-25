import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/2_presentation/pages/create/create_page.dart';
import 'package:todo_app/2_presentation/pages/detail/detail_page.dart';
import 'package:todo_app/2_presentation/pages/edit/edit_page.dart';
import 'package:todo_app/2_presentation/pages/home/bloc/delete/delete_bloc.dart';
import 'package:todo_app/2_presentation/pages/home/bloc/home/home_bloc.dart';
import 'widget/todo_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Practice'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<HomeBloc>().add(HomeEvent());
            },
          )
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeError) {
            return Center(child: Text(state.message));
          }

          if (state is HomeSuccess) {
            final todos = state.todos;

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return TodoCardWidget(
                  title: todo.title,
                  subtitle: 'id: ${todo.id} • user: ${todo.userId}',
                  completed: todo.completed,
                  onCheckChanged: (v) {
                    // برای بعدا، آپدیت وضعیت
                  },
                  onSelected: (v) {
                    if (v == 'edit') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditTodoScreen(todo: todo),
                        ),
                      );
                    } else if (v == 'delete') {
                      context.read<DeleteBloc>().add(DeleteEvent(id: todo.id));
                    } else if (v == 'details') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TodoDetailScreen(todoId: todo.id),
                        ),
                      );
                    }
                  },
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateTodoScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
