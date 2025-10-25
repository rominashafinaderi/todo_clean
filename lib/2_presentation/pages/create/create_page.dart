import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/2_presentation/pages/create/bloc/create_bloc.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  bool _completed = false;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _onSavePressed() {
    if (_formKey.currentState!.validate()) {
      context.read<CreateBloc>().add(
        CreateEvent(
          userId: 1, // در API واقعی می‌تونی از user auth بگیری
          title: _titleController.text.trim(),
          completed: _completed,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateBloc, CreateState>(
      listener: (context, state) {
        if (state is CreateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تسک با موفقیت ایجاد شد')),
          );
          Navigator.pop(context, true); // برگرد به صفحه قبل با نتیجه موفق
        } else if (state is CreateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final loading = state is CreateLoading;

        return Scaffold(
          appBar: AppBar(title: const Text('ایجاد تسک جدید')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration:
                    const InputDecoration(labelText: 'عنوان تسک'),
                    validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'عنوان لازم است' : null,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text('انجام شده:'),
                      Checkbox(
                        value: _completed,
                        onChanged: (v) =>
                            setState(() => _completed = v ?? false),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: loading ? null : _onSavePressed,
                    icon: loading
                        ? const SizedBox.shrink()
                        : const Icon(Icons.save),
                    label: loading
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
