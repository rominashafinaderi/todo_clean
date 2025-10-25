part of 'delete_bloc.dart';

@immutable
sealed class DeleteState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class DeleteInitial extends DeleteState {}
final class DeleteLoading extends DeleteState {}
final class DeleteError extends DeleteState {}
final class DeleteSuccess extends DeleteState {}
