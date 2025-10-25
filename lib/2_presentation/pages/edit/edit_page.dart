import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/1_domain/entities/todo_entity.dart';
import 'package:todo_app/2_presentation/pages/edit/bloc/edit_bloc.dart';

class EditTodoScreen extends StatefulWidget {
  final TodoEntity todo;

  const EditTodoScreen({super.key, required this.todo});

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  bool _completed = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo.title);
    _completed = widget.todo.completed;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditBloc, EditState>(
      listener: (context, state) {
        if (state is EditSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تسک با موفقیت ویرایش شد')),
          );
          Navigator.pop(context, true);
        } else if (state is EditError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('خطا: ${state.message}')),
          );
        }
      },
      builder: (context, state) {
        final saving = state is EditLoading;

        return Scaffold(
          appBar: AppBar(title: const Text('ویرایش تسک')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: 'عنوان'),
                    validator: (v) => (v == null || v.isEmpty)
                        ? 'عنوان لازم است'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  CheckboxListTile(
                    title: const Text('انجام شده'),
                    value: _completed,
                    onChanged: (v) => setState(() => _completed = v ?? false),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: saving
                        ? null
                        : () {
                      if (_formKey.currentState!.validate()) {
                        final updatedTodo = widget.todo.copyWith(
                          title: _titleController.text,
                          completed: _completed,
                        );
                        context
                            .read<EditBloc>()
                            .add(EditEvent(todo: updatedTodo));
                      }
                    },
                    icon: saving
                        ? const SizedBox.shrink()
                        : const Icon(Icons.save),
                    label: saving
                        ? const Text('در حال ذخیره...')
                        : const Text('ذخیره'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
