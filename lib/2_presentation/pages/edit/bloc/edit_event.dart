part of 'edit_bloc.dart';
class EditEvent extends Equatable {

  final TodoEntity todo;
  const EditEvent({required this.todo});

  @override
  List<Object?> get props => [todo];
}
