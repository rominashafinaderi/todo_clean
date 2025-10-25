import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/2_presentation/pages/create/bloc/create_bloc.dart';
import 'package:todo_app/2_presentation/pages/detail/bloc/detail_bloc.dart';
import 'package:todo_app/2_presentation/pages/edit/bloc/edit_bloc.dart';
import 'package:todo_app/2_presentation/pages/home/bloc/delete/delete_bloc.dart';
import 'package:todo_app/2_presentation/pages/home/bloc/home/home_bloc.dart';
import 'package:todo_app/2_presentation/pages/home/home_page.dart';
import 'package:todo_app/injection.dart';

import 'injection.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const TodoApp());
}


class TodoApp extends StatelessWidget {
  const TodoApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [  BlocProvider(create: (_) => di.inj<CreateBloc>()),
        BlocProvider(create: (_) => di.inj<HomeBloc>()),
        BlocProvider(create: (_) => di.inj<DetailBloc>()),
        BlocProvider(create: (_) => di.inj<EditBloc>()),
        BlocProvider(create: (_) => di.inj<DeleteBloc>()),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo Practice',
        home: const HomeScreen(),
      ),
    );
  }
}