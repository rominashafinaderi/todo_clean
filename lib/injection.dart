import 'package:get_it/get_it.dart';
import 'package:todo_app/0_data/datasources/Remote/todo_remote_datasource.dart';
import 'package:todo_app/0_data/repositories/todo_repo_impl.dart';
import 'package:todo_app/1_domain/repositories/todo_repo.dart';
import 'package:todo_app/1_domain/usecases/todo_usecase.dart';
import 'package:todo_app/2_presentation/pages/create/bloc/create_bloc.dart';
import 'package:todo_app/2_presentation/pages/detail/bloc/detail_bloc.dart';
import 'package:todo_app/2_presentation/pages/edit/bloc/edit_bloc.dart';
import 'package:todo_app/2_presentation/pages/home/bloc/delete/delete_bloc.dart';
import 'package:todo_app/2_presentation/pages/home/bloc/home/home_bloc.dart';

final inj = GetIt.I;

Future<void> init() async {
  //datasource
  inj.registerLazySingleton<TodoRemoteDataSource>(() => TodoRemoteDataSourceImpl());
  //repo
  inj.registerLazySingleton<TodoRepo>(() => TodoRepoImpl(todoRemoteDataSource: inj()));
  //useCase
  inj.registerLazySingleton<TodoUseCase>(() => TodoUseCase(todoRepo: inj()));
  // Create
  inj.registerFactory(() => CreateBloc(todoUseCase: inj()));
  // Detail
  inj.registerFactory(() => DetailBloc(todoUseCase: inj()));
  // Update
  inj.registerFactory(() => EditBloc(todoUseCase: inj()));
  // Delete
  inj.registerFactory(() => DeleteBloc(todoUseCase: inj()));
  // Get All
  inj.registerFactory(() => HomeBloc(todoUseCase: inj()));
}
